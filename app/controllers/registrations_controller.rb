class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registration = current_user.registrations.new(registration_params)
    @registration.event_id = params[:event_id]

    if @registration.event_available?
      @registration.set_total_price
      @registration.save
      redirect_to @registration.event, notice: "Thank you for booking!"
    else
      redirect_to @registration.event, notice: "Sorry! This listing is not available during the dates you requested."
    end
  end

  private

  def get_total_price(registration_params)
    checkin, checkout = get_dates(registration_params)

    total_days = (checkout - checkin).to_i
    registration_params[:price].to_i * total_days
  end

  def get_dates(registration_params)
    checkin  =  Date.new(registration_params["starts_at(1i)"].to_i,
                         registration_params["starts_at(2i)"].to_i,
                         registration_params["starts_at(3i)"].to_i)

    checkout =  Date.new(registration_params["ends_at(1i)"].to_i,
                         registration_params["ends_at(2i)"].to_i,
                         registration_params["ends_at(3i)"].to_i)

    return checkin, checkout
  end

  def registration_params
    params.require(:registration).permit(:starts_at, :ends_at, :price, :total, :event_id)
  end
end
