class EventCreator
  def initialize(event_instance_generator = EventInstanceGenerator.new)
    @event_instance_generator = event_instance_generator
  end

  def call(event_form, create_venue)
    if event_form.valid?
      event_form.venue.save! if create_venue
      event = Event.create!(name: event_form.name)
      event_seed = EventSeed.create! \
        event: event,
        url: event_form.url,
        venue_id: event_form.venue_id
      event_period = EventPeriod.create! \
        event_seed: event_seed,
        frequency: event_form.frequency,
        start_date: event_form.start_date
      instance_creation_result = @event_instance_generator.call(event_period)
      Success.new(event, instance_creation_result.created_dates)
    else
      Failure.new
    end
  end

  class Success
    attr_reader :event

    def initialize(event, dates)
      @event = event
      @dates = dates || []
    end

    def success?
      true
    end

    def message
      "New event created. #{dates_message}"
    end

  private

    def dates_message
      case @dates.count
      when 0 then 'No instances created.'
      when 1 then "1 instance created: #{date_string}"
      else "#{@dates.count} instances created: #{date_string}"
      end
    end

    def date_string
      @dates.map{|d| I18n.l(d)}.join(", ") # TODO: Better way of doing this - in one step?
    end
  end

  class Failure
    def success?
      false
    end
  end
end
