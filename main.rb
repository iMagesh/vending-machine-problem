#!/usr/bin/env ruby

require_relative './lib/product'
require_relative './lib/coin'
require_relative './lib/vending_machine'
require_relative './lib/payable'
require_relative './lib/dispensable'
require_relative './lib/reportable'
require_relative './lib/inventory_management'
require_relative './lib/currency'

def start_vending_machine
  vm = VendingMachine.new
  vm.add_product(Product.new("Water", 1.25, 10))
  vm.add_product(Product.new("Soda", 1.50, 5))
  vm.add_product(Product.new("Chips", 1.00, 15))

  loop do
    puts "\nWelcome to the Vending Machine!"
    vm.show_products

    puts "Insert coins (type 'done' when finished):"
    loop do
      coin_input = gets.chomp
      break if coin_input == "done"
      vm.insert_coin(Coin.new(coin_input.to_f))
    end

    puts "Please select a product by name or type 'exit' to quit:"
    choice = gets.chomp
    break if choice == "exit"

    vm.select_product(choice)
  end

  puts "Thank you for using the Vending Machine!"
end

start_vending_machine
