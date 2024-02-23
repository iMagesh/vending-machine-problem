module Dispensable
  def dispense(product_name)
    product = @inventory.find { |p| p.name == product_name }
    product.quantity -= 1 if product && product.quantity > 0
  end
end
