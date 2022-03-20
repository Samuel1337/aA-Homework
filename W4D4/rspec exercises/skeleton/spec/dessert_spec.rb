require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Gusteau") }
  subject(:dessert) { Dessert.new("cake", 2, chef) }
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
    
    it "sets a quantity" do
      expect(dessert.quantity).to eq(2)
    end
    
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "2", chef) }.to raise_error(ArgumentError)
    end
  end
  
  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("chocolate")
      expect(dessert.ingredients).to eq(["chocolate"])
    end
  end
  
  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("chocolate")
      dessert.add_ingredient("vanilla")
      dessert.mix!
      expect(dessert.ingredients.sort).to eq(["chocolate","vanilla"].sort)
    end
  end
  
  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to eq(0)
    end
    
    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(7) }.to raise_error("not enough left!")
    end
  end
  
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gusteau")
      expect(dessert.serve).to eq("Chef Gusteau has made 2 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(dessert.heat!).to eq(400)
    end
  end
end
