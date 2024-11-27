class Driver < ApplicationRecord
  belongs_to :user

  has_many :riders

  geocoded_by :current_address
  after_validation :geocode, if: ->(obj){obj.latitude.blank? && obj.longitude.blank?}

  def current_address
    "#{latitude},#{longitude}"
  end

  
end
