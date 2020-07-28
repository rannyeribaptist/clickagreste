require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should validate_presence_of :street }
  it { should validate_presence_of :neighbohood }
  it { should validate_presence_of :number }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :complement }
  it { should validate_presence_of :zip_code }
end
