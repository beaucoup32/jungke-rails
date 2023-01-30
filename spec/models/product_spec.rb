require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should fail with no name' do
      params = {
        :name => nil,
        :description => 'Loreum ipsum',
        :category_id => 1,
        :quantity => 3,
        :image => 'url',
        :price => 64.99
      }
      
      @product = Product.new(params)
      @product.save

      expect(@product.save).to be false
    end

    it 'should fail with no price' do
      params = {
        :name => 'Plant',
        :description => 'Loreum ipsum',
        :category_id => 1,
        :quantity => 3,
        :image => 'url',
        :price => nil
      }
      
      @product = Product.new(params)
      @product.save

      expect(@product.save).to be false
    end

    it 'should fail with no quantity' do
      params = {
        :name => 'Plant',
        :description => 'Loreum ipsum',
        :category_id => 1,
        :quantity => nil,
        :image => 'url',
        :price => 64.99
      }
      
      @product = Product.new(params)
      @product.save

      expect(@product.save).to be false
    end

    it 'should fail with no category' do
      params = {
        :name => 'Plant',
        :description => 'Loreum ipsum',
        :category_id => nil,
        :quantity => 3,
        :image => 'url',
        :price => 64.99
      }
      
      @product = Product.new(params)
      @product.save

      expect(@product.save).to be false
    end

    it 'should return an error when condition isnt met' do
      @product = Product.new
      @product.save

      expect(@product.errors.full_messages).not_to be_empty
    end

  end
end
