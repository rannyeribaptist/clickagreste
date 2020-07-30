require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :tax_id }
  it { should validate_presence_of :picture }
  it { should validate_presence_of :description }
  it { should validate_presence_of :company_categories }

  company = Company.new(name: "test", tax_id: "test", picture: "test", description: "test", company_categories: ["teste"])
  company2 = Company.new(name: "test", tax_id: "test", picture: "test", description: "test", company_categories: ["teste"])

  context "on create" do
    it "should have at least one contact_info" do
      company.build_address(street: "test", neighbohood: "test", number: "test", city: "test", complement: "test", zip_code: "test")
      expect(company.save).not_to be_truthy

      company.contact_infos.build(name: "test", icon: "test", contact: "test")
      expect(company.save).to be_truthy
    end
    
    it "should have an address" do
      company2.contact_infos.build(name: "test", icon: "test", contact: "test")
      expect(company2.save).not_to be_truthy
      
      company2.build_address(street: "test", neighbohood: "test", number: "test", city: "test", complement: "test", zip_code: "test")
      expect(company2.save).to be_truthy
    end
  end
end
