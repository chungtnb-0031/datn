require "rails_helper"

RSpec.describe Post, type: :model do
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :travel_place }
    it { should have_many(:comments).dependent :destroy }
    it { should have_many(:reactions).dependent :destroy }
    it { should have_many(:post_images).dependent :destroy }
  end

  describe "validations" do
    it { should validate_presence_of :content }
    it { should validate_presence_of :title }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :travel_place_id }
  end
end
