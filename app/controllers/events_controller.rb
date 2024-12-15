class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/:id
  def show
    @attendees = @event.attendees
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new
    end
  end

  # GET /events/:id/edit
  def edit
  end

  # PATCH/PUT /events/:id
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully deleted."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :time, :location, :organizer)
  end
end

def require_login
  unless logged_in?
    redirect_to login_path, alert: "You must be logged in to access that page."
  end
end
