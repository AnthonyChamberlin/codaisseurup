require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_presence_of(:location) }
  end
end

describe "association with user" do
  let(:user) { create :user }

  it "belongs to a user" do
    event = user.events.build(name: "Shared")
    expect(event.user).to eq(user)
  end
end
