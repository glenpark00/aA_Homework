require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new('cookie', 10, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty 
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('ice cream', '100', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('flour')
      expect(dessert.ingredients).to eq(['flour'])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient('milk')
      dessert.add_ingredient('chocolate chips')
      dessert.add_ingredient('eggs')
      ingredients = ['flour', 'milk', 'chocolate chips', 'eggs']
      dessert.mix!
      dessert.ingredients.each do |ingredient|
        expect(ingredients).to include(ingredient)
      end
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(100) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef chef the Great Baker")
      expect(dessert.serve).to eq('Chef chef the Great Baker has made 10 cookies!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      allow(chef).to receive(:bake).and_return(dessert.heat!)
      dessert.make_more
      expect(dessert.temp).to eq(400)
    end
  end
end
