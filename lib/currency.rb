module Currency
  attr_accessor :coins_pool

  def initialize_currency
    @coins_pool = {0.01 => 10, 0.05 => 10, 0.10 => 10, 0.25 => 10, 1.00 => 10}  # Initial coin pool for change
    @total_inserted = 0.0
  end

  def insert_coin(coin)
    @total_inserted += coin.denomination
    @coins_pool[coin.denomination] += 1  # Update coin pool with inserted coin
    puts "#{coin.denomination} coin inserted."
  end

  def calculate_change(amount_due)
    change_due = @total_inserted - amount_due
    change_to_give = {}

    @coins_pool.keys.sort.reverse.each do |denom|
      next if change_due < denom
      num_coins = [change_due.div(denom), @coins_pool[denom]].min
      change_due -= num_coins * denom
      change_due = change_due.round(2)
      change_to_give[denom] = num_coins
      @coins_pool[denom] -= num_coins
      break if change_due.zero?
    end

    if change_due > 0
      puts "Unable to provide exact change. Returning inserted coins."
      @coins_pool.each { |denom, count| @coins_pool[denom] += change_to_give[denom] if change_to_give[denom] }  # Revert changes
      @total_inserted = 0
      return false
    else
      puts "Change given: #{change_to_give.map { |denom, count| "#{count}x#{denom}" }.join(', ')}"
      @total_inserted = 0
      return true
    end
  end

  # Resets the transaction, clearing the total inserted amount and coin count.
  def reset_transaction
    @total_inserted = 0.0
    @coins.clear
  end
end
