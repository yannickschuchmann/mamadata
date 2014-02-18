# encoding : utf-8

# require 'money'
# require 'money/bank/google_currency'

# (optional)
# set the seconds after than the current rates are automatically expired
# by default, they never expire
# Money::Bank::GoogleCurrency.ttl_in_seconds = 86400

# set default bank to instance of GoogleCurrency
# Money.default_bank = Money::Bank::GoogleCurrency.new

MoneyRails.configure do |config|

  # To set the default currency
  #
   config.default_currency = :inr

  # Set default bank object
  #
  # Example:
   # config.default_bank = ::Money.default_bank 

  # Add exchange rates to current money bank object.
  # (The conversion rate refers to one direction only)
  #
  # Example:
  # config.add_rate "USD", "CAD", 1.24515
  # config.add_rate "CAD", "USD", 0.803115

  # To handle the inclusion of validations for monetized fields
  # The default value is true
  #
  # config.include_validations = true

  # Default ActiveRecord migration configuration values for columns:
  #
   config.amount_column = { prefix: '',           # column name prefix
                            postfix: '_paise',    # column name  postfix
                            column_name: nil,     # full column name (overrides prefix, postfix and accessor name)
                            type: :integer,       # column type
                            present: true,        # column will be created
                            null: true,          # other options will be treated as column options
                            default: 0
                          }

  # config.amount_column = { prefix: '',           # column name prefix
  #                           postfix: '_cents',    # column name  postfix
  #                           column_name: nil,     # full column name (overrides prefix, postfix and accessor name)
  #                           type: :integer,       # column type
  #                           present: true,        # column will be created
  #                           null: true,          # other options will be treated as column options
  #                           default: 0
  #                         }

                          
  config.currency_column = { prefix: '',
                             postfix: '_currency',
                             column_name: nil,
                             type: :string,
                             present: true,
                             null: false,
                             default: 'INR'
                           }

  # Register a custom currency
  #
  # Example:
  #  config.register_currency = {
  #    :priority            => 1,
  #    :iso_code            => "INR",
  #    :name                => "Indian Rupee",
  #    :symbol              => "Rs",
  #    :symbol_first        => true,
  #    :subunit             => "Paisa",
  #    :subunit_to_unit     => 100,
  #    :thousands_separator => ".",
  #    :decimal_mark        => ","
  #  }

  # config.register_currency = {
  #    :priority            => 2,
  #    :iso_code            => "USD",
  #    :name                => "US Dollar",
  #    :symbol              => "$",
  #    :symbol_first        => true,
  #    :subunit             => "Cent",
  #    :subunit_to_unit     => 100,
  #    :thousands_separator => ".",
  #    :decimal_mark        => ","
  #  }




  # Set money formatted output globally.
  # Default value is nil meaning "ignore this option".
  # Options are nil, true, false.
  #
  # config.no_cents_if_whole = nil
  # config.symbol = nil
end
