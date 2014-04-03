require 'spec_helper'

describe Recipe do
  it { should validate_presence_of :name }
  it { should have_and_belong_to_many :tags }

  context ".random_show" do
    it "returns a newer recipe with few ratings" do
      recipe = Recipe.create(name: "test", )

    end
  end
end
