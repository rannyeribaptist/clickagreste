require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :social_security_number }
  it { should validate_presence_of :email }

  user = User.new(name: "test", social_security_number: "123", email: "user@test.com", password: "123123", password_confirmation: "123123")
  user2 = User.new(name: "test2", social_security_number: "123", email: "user2@test.com", password: "123123", password_confirmation: "123123")

  context "sign_up" do
    it "can not be an admin, unless it is the first user" do
      user.admin = true
      user2.admin = true

      expect (user).to be_valid
      expect (user2).not_to be_valid
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
