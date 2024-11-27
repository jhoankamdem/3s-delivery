class Ride < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  enum status: {requested: 0, accepted: 1, in_progress: 2, completed: 3, cancelted: 4}
end
