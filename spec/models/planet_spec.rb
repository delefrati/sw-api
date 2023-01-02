require 'rails_helper'

RSpec.describe Planet, type: :model do
  fixtures :planets
  it "has 2 planets" do
    planets = Planet.all
    expect(planets.count).to eq 2
  end
end
