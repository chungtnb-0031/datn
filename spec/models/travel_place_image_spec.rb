require "rails_helper"

RSpec.describe TravelPlaceImage, type: :model do
  describe "associations" do
    it { should belong_to :travel_place }

  end

  describe "validations" do
    it { should validate_presence_of :travel_place_id }
  end
end
