require_relative 'payable'
require_relative 'dispensable'

class Product
  include Payable
  include Dispensable

  attr_accessor :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
    @total_inserted = 0
  end
end
