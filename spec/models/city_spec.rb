require 'rails_helper'

RSpec.describe City, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :picture }
end
