
# Vending Machine Simulator

This Ruby project simulates a vending machine, demonstrating the use of Object-Oriented Programming (OOP) principles, mixins for code reuse and organization, and modular programming.

## Problem Statement

Create a Ruby program to simulate a vending machine. The simulation should include functionalities for product selection, coin insertion, transaction processing, and change dispensing, utilizing mixins for enhanced code organization and reusability.

### Key Components

- **Product**: Represents a single product with attributes like name, price, and quantity.
- **Coin**: Represents a single coin with a denomination value.
- **VendingMachine**: Manages the inventory of products, accepts coins, and facilitates user transactions.
- **Mixins**: Include `Payable`, `Dispensable`, and `Reportable` for payment processing, product dispensing, and sales reporting, respectively.

## Requirements

- Ruby environment.
- Basic understanding of OOP and Ruby programming.

## Project Structure

```
vending_machine_project/
│
├── lib/
│   ├── product.rb
│   ├── coin.rb
│   ├── vending_machine.rb
│   ├── payable.rb
│   ├── dispensable.rb
│   ├── reportable.rb
│   ├── inventory_management.rb
│   └── currency.rb
│
└── bin/
    └── start.rb
```

## Setup and Running

1. **Clone the repository**: Clone or download the project to your local machine.

2. **Navigate to the project directory**: Change directory to the root of the project.

3. **Run the Application**: Execute the runner script to start the vending machine simulation.
   ```bash
   ruby bin/start.rb
   ```

### How to Use

- Follow the on-screen prompts to insert coins and select products.
- The vending machine will process transactions, dispense products, and return change as necessary.

## Customization

You can add more products, support different currencies, or enhance the user interface directly in the code files under the `lib/` directory.

## Troubleshooting

Ensure Ruby is correctly installed on your system and the path to the `start.rb` file is correct when running the application.

## Contributing

Contributions to the project are welcome. Please ensure to follow best coding practices and submit pull requests for review.

## License

This project is open-sourced under the MIT License.
