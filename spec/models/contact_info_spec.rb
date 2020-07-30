require 'rails_helper'

RSpec.describe ContactInfo, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :icon }
  it { should validate_presence_of :contact }
end
