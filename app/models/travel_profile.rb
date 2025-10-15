class TravelProfile < ApplicationRecord
  belongs_to :user

  # Serialize arrays for hobbies and destinations
  serialize :hobbies, type: Array, coder: JSON
  serialize :destinations_interested, type: Array, coder: JSON

  TRAVEL_STYLES = ['Luxury', 'Budget', 'Backpacking', 'Comfortable', 'Adventure'].freeze
  BUDGET_RANGES = ['Under $1000', '$1000-$3000', '$3000-$5000', '$5000-$10000', 'Over $10000'].freeze
  TRIP_LENGTHS = ['Weekend (2-3 days)', 'Week (4-7 days)', '1-2 weeks', '2-4 weeks', 'Month+'].freeze
  ADVENTURE_LEVELS = ['Relaxing', 'Moderate', 'Adventurous', 'Extreme'].freeze
end
