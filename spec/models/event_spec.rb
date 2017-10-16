require 'rails_helper'

# ----- TEST the validations are correct in the event model
RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_presence_of(:location) }
  end
end

# ----- TEST the Association with the User
describe "association with user" do
  let(:user) { create :user }

  it "belongs to a user" do
    event = user.events.build(name: "Shared")
    expect(event.user).to eq(user)
  end

# ----- TEST the associations with the new registration model
describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:registration) { create :registration, event: event, user: guest_user }

  it "has guests" do
    expect(event.guests).to include(guest_user)
  end
end

  describe "order by name" do
    let!(:event_1) { create :event, name: "Crew" }
    let!(:event_2) { create :event, name: "Ballet" }
    let!(:event_3) { create :event, name: "Aerobics" }


    it "returns event name in alphabetical order" do
      expect(Event.order_by_name).to eq([event_1, event_2, event_3])
    end
    
  end


end
