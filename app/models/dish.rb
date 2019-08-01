class Dish < ApplicationRecord
	has_and_belongs_to_many :restaurants
	belongs_to :category
  has_many :pictures, as: :imageble, dependent: :destroy
  accepts_nested_attributes_for :pictures
  has_many :ratings
  
  validates_presence_of :name,message:"can't be empty"
  validates_presence_of :price,message:"can't be empty"
  validates_presence_of :category,message:"can't be empty"
  
  scope :by_price, ->(price){order(price)}
  scope :by_rating,->{joins(:ratings).group('dishes.id').order('avg(ratings.rating) desc')}
  scope :sort_ratings,->(rating){joins(:ratings).group('dishes.id').having('avg(ratings.rating)>= ?',rating).order('avg(ratings.rating) asc')}
  scope :by_category, ->(category){where(category_id: category)}
end
