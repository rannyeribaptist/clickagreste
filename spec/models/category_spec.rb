require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :color }
  it { should validate_presence_of :icon }
  it { should validate_presence_of :city_id }
end
