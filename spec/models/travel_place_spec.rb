require "rails_helper"

RSpec.describe TravelPlace, type: :model do
  describe "associations" do
    it { should belong_to :city }
    it { should belong_to :type_travel_place }
    it { should have_many(:travel_place_images).dependent :destroy }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city_id }
  end
end
