class AttendeesController < ApplicationController
  before_action :set_event
  before_action :set_attendee, only: [ :edit, :update, :destroy ]

  # GET /events/:event_id/attendees/new
  def new
    @attendee = @event.attendees.new
  end

  # POST /events/:event_id/attendees
  def create
    @attendee = @event.attendees.new(attendee_params)
    if @attendee.save
      redirect_to @event, notice: "Attendee was successfully created."
    else
      render :new
    end
  end

  # GET /events/:event_id/attendees/:id/edit
  def edit
  end

  # PATCH/PUT /events/:event_id/attendees/:id
  def update
    if @attendee.update(attendee_params)
      redirect_to @event, notice: "Attendee was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /events/:event_id/attendees/:id
  def destroy
    @attendee.destroy
    redirect_to @event, notice: "Attendee was successfully deleted."
  end

  private

  # Set the event for the attendees
  def set_event
    @event = Event.find(params[:event_id])
  end

  # Set the attendee
  def set_attendee
    @attendee = @event.attendees.find(params[:id])
  end

  # Strong parameters to allow only the necessary fields for attendees
  def attendee_params
    params.require(:attendee).permit(:name, :email)
  end
end
