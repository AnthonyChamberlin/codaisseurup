require 'rails_helper'

 describe "Viewing an individual event" do
   let(:user) { create :user }
   let(:event) { create :event, user: user }

   it "shows the event's details" do
     visit event_url(event)

     expect(page).to have_text(event.name)
   end
 end
