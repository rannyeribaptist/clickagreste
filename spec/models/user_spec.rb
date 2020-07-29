require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }

  user = User.new(email: "user@test.com", password: "123123", password_confirmation: "123123")
  user2 = User.new(email: "user2@test.com", password: "123123", password_confirmation: "123123")
  user3 = User.new(email: "user2@test.com", password: "123123", password_confirmation: "123123")
  
  context "sign_up" do
    it "can not be an admin, unless it is the first user" do
      user.admin = true
      user2.admin = true

      expect(user.save).to be_truthy
      expect(user2.save).not_to be_truthy
    end
  end

  context "after sign_up" do
    it "should finish registration" do
      user3.save
      
      expect(user3.save).not_to be_truthy
      user3.name = "Teste"
      user3.social_security_number = "123"
      expect(user3.save).to be_truthy
    end
  end

  context "managing data" do
    context "if not admin" do
      pending "can not manage cities"
      pending "can not manage categories"
      pending "can only manage it's own address"
      pending "can not manage companies"
      pending "can not manage contact_infos"
    end
  end
end
