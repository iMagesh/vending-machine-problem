require_relative '../lib/inventory_management'
require_relative '../lib/currency'
require_relative '../lib/reportable'
require_relative './dispensable'

class VendingMachine
  include InventoryManagement
  include Currency
  include Reportable
  include Dispensable

  def initialize
    @inventory = []
    @coins = []
    @total_inserted = 0
  end

  def insert_coin(coin)
    @coins << coin
    @total_inserted += coin.denomination
    puts "#{coin.denomination} coin inserted."
  end

  def select_product(product_name)
    product = @inventory.find { |p| p.name == product_name }
    if product.nil?
      puts "Product not found."
      return
    end
    if product.quantity <= 0
      puts "Product sold out."
      return
    end
    if product.price > @total_inserted
      puts "Insufficient funds."
      return
    end

    dispense(product_name)
    give_change(product.price)
    reset_transaction
  end

  def give_change(price)
    change = @total_inserted - price
    puts "Dispensing #{change} in change." if change > 0
  end

  def reset_transaction
    @total_inserted = 0
  end

  def show_products
    puts "Available products:"
    @inventory.each do |product|
      puts "#{product.name}: Price #{product.price}, Quantity #{product.quantity}"
    end
  end
end
