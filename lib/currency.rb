module Currency
  attr_reader :total_inserted, :coin_denominations

  # Initializes the currency management system with available coin denominations.
  def initialize_currency
    @total_inserted = 0.0
    @coin_denominations = [0.01, 0.05, 0.10, 0.25, 1.00]  # Example for USD
    @coins = Hash.new(0)  # Tracks the count of each coin denomination inserted
  end

  # Adds a coin to the total inserted amount and updates the coin count.
  # @param coin [Coin] the coin being inserted
  def insert_coin(coin)
    if coin_denominations.include?(coin.denomination)
      @total_inserted += coin.denomination
      @coins[coin.denomination] += 1
      true
    else
      puts "Coin denomination not accepted."
      false
    end
  end

  # Calculates change to be returned to the user and updates the coin count accordingly.
  # @param amount_due [Float] the total amount due for the purchase
  # @return [Array] the denominations of coins to be returned as change
  def calculate_change(amount_due)
    change_due = (@total_inserted - amount_due).round(2)
    change_given = []

    return change_given if change_due <= 0

    @coin_denominations.sort.reverse.each do |denomination|
      while change_due >= denomination && @coins[denomination] > 0
        change_due = (change_due - denomination).round(2)
        change_given << denomination
        @coins[denomination] -= 1
      end
    end

    if change_due > 0
      puts "Unable to provide exact change. Returning inserted coins."
      return @coins.flat_map { |denomination, count| Array.new(count, denomination) }
    end

    change_given
  end

  # Resets the transaction, clearing the total inserted amount and coin count.
  def reset_transaction
    @total_inserted = 0.0
    @coins.clear
  end
end
