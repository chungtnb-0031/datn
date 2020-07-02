require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :post }
    it { should belong_to :reaction_type }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :reaction_type_id }
    it { should validate_uniqueness_of(:post_id).case_insensitive.scoped_to(:user_id) }
  end
end
