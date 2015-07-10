class EventGeneratorsController < ApplicationController
  # TODO: Authenticate! - put in specs
  # before_action :authenticate_user!

  # GET /event/:event_id/event_generators/:id/edit
  def edit
    @event = Event.find(params[:event_id])
    @event_generator = EventGenerator.find(params[:id])
  end

  # PATCH /event/:event_id/event_generators/:id
  def update
    @event_generator = EventGenerator.find(params[:id])

    event_generator_params = params.require(:event_generator).permit(:end_date)
    # TODO - failure case

    @event_generator.update!(event_generator_params)

    redirect_to event_path(@event_generator.event)
  end

  # GET /event/:event_id/event_generators/new
  def new
    @event = Event.find(params[:event_id])
    @event_generator = EventGenerator.new
  end

  # ??? /event/:event_id/event_generators
  def create
    event = Event.find(params[:event_id])

    @event_generator = EventGenerator.new(event_generator_params)
    @event_generator.event_seed = event.event_seeds.last # TODO: THIS IS WRONG!!!! TEMPORARY
    @event_generator.save!

    redirect_to event_path(@event_generator.event)
  end


  private def event_generator_params
    params.require(:event_generator).permit(
      :start_date,
      :frequency
    )
  end
end
