require 'spec_helper'

describe Recipe do
  it { should validate_presence_of :name }
  it { should validate_numericality_of :rating }
  it { should allow_value(5).for :rating }
  it { should_not allow_value(8).for :rating }
  it { should have_and_belong_to_many :tags }
end
