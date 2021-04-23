require 'rails_helper'

RSpec.describe User, type: :model do
  context "validate test" do
    it 'ensures email presence'do
      user = User.new(email: 'sample@example.com').save
      expect(user).to eq(false)  
    end
  end
end