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
    @total_inserted = 0.0
    initialize_currency  # Ensure the Currency module is initialized
  end

  def insert_coin(coin)
    success = super(coin)  # Use super to call insert_coin from Currency module
    puts "#{coin.denomination} coin inserted." if success
  end

  def select_product(product_name)
    product = @inventory.find { |p| p.name == product_name }
    if product.nil?
      puts "Product not found."
      return
    elsif product.quantity <= 0
      puts "Product sold out."
      return
    elsif !sufficient_funds?(product.price)
      puts "Insufficient funds."
      return
    end

    dispense(product_name)
    change_given = calculate_change(product.price)
    puts "Dispensing product: #{product_name}"
    unless change_given
      puts "Dispensing change: #{change_given.join(', ')}"
    end
    reset_transaction
  end

  def sufficient_funds?(price)
    @total_inserted >= price
  end

  # Assuming dispense method reduces quantity and is already correctly implemented

  def show_products
    puts "Available products:"
    @inventory.each do |product|
      puts "#{product.name}: Price #{product.price}, Quantity #{product.quantity}"
    end
  end
end
