class Coin
  attr_reader :denomination, :currency

  # Initializes a new Coin instance with a given denomination and optionally currency.
  # @param denomination [Float] the value of the coin
  # @param currency [String] the currency of the coin (default: "USD")
  def initialize(denomination, currency = "USD")
    @denomination = denomination
    @currency = currency
    validate_denomination
  end

  # Validates the denomination to ensure it's a supported value.
  # You can modify this method to include or exclude specific coin denominations.
  def validate_denomination
    # Example of supported denominations: 0.01, 0.05, 0.10, 0.25, 1.00 for USD
    valid_denominations = [0.01, 0.05, 0.10, 0.25, 1.00]
    unless valid_denominations.include?(@denomination)
      raise ArgumentError, "Unsupported coin denomination: #{@denomination}"
    end
  end

  # Represents the coin as a string.
  # @return [String] the string representation of the coin
  def to_s
    "#{@denomination} #{@currency}"
  end
end
