module InventoryManagement
  def add_product(product)
    @inventory << product
  end

  def remove_product(product_name)
    @inventory.reject! { |p| p.name == product_name }
  end

  def check_availability(product_name)
    @inventory.any? { |p| p.name == product_name && p.quantity > 0 }
  end
end
