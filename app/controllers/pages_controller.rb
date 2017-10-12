class PagesController < ApplicationController
  def home
    @events = Event.all.order("created_at DESC")
  end
end
