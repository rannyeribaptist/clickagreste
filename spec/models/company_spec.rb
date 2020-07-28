require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :tax_id }
  it { should validate_presence_of :picture }
  it { should validate_presence_of :description }
  it { should validate_presence_of :company_categories }

  company = Company.new(name: "test", tax_id: "test", picture: "test", description: "test")

  context "on create" do
    it "should have at least one contact_info" do
      company.address.new(street: "test", neighbohood: "test", number: "test", city: "test", state: "test", complement: "test", zip_code: "test")
      expect (company).not_to be_valid

      company.contact_info.new(name: "test", icon: "test", contact: "test")
      expect (company).to be_valid
    end

    it "should have an address" do
      company.contact_info.new(name: "test", icon: "test", contact: "test")
      expect (company).not_to be_valid
      company.address.new(street: "test", neighbohood: "test", number: "test", city: "test", state: "test", complement: "test", zip_code: "test")
      expect (company).to be_valid
    end
  end
end
