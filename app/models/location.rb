class Location < ApplicationRecord
  has_and_belongs_to_many :restaurants
  
  validates_presence_of :street,message:"can't be empty"
  validates_presence_of :city,message:"can't be empty"
  validates_presence_of :state,message:"can't be empty"
  validates_presence_of :pincode,message:"can't be empty"
  validates_presence_of :country,message:"can't be empty"

  geocoded_by :city
  after_validation :geocode, :if => :city_changed?
end
