require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :content }
  end
end
