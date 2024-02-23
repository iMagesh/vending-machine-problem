module Payable
  def accept_payment(amount)
    @total_inserted += amount
  end

  def sufficient_funds?(price)
    @total_inserted >= price
  end
end
