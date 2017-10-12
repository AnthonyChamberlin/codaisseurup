class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.events
  end

  def show
    @categories = @event.categories
    @photos = @event.photos
  end

  def new
    @event = current_user.events.build
    @categories = Category.all
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      image_params.each do |image|
      @event.photos.create(image: image)
    end
      redirect_to edit_event_path(@event), notice: "Event Created!"
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
    if current_user.id == @event.user.id
      @photos = @event.photos
    else
      redirect_to root_path, notice: "You dont have permission to do that."
    end
  end

  def update
    if @event.update(event_params)
      image_params.each do |image|
      @event.photos.create(image: image)
    end
      redirect_to edit_event_path(@event), notice: "Event Updated"
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params
      .require(:event)
      .permit(
        :name, :description, :location, :price, :capacity, :includes_food, :includes_drink, :starts_at, :ends_at, :active, category_ids: []
      )
  end

  def image_params
      # Turnary Operators are what Arno dislikes
        params[:images].present? ? params.require(:images) : []
  end
end
