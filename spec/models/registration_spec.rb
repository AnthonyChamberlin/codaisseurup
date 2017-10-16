require 'rails_helper'

RSpec.describe Registration, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:room) { create :room, user: host_user }
  let!(:booking) { create :booking, room: room, user: guest_user }

  it "has guests" do
    expect(room.guests).to include(guest_user)
  end
end
