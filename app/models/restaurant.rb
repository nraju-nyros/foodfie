class Restaurant < ApplicationRecord
	has_and_belongs_to_many :locations, :dependent => :destroy
	has_and_belongs_to_many :dishes, :dependent => :destroy
	has_many :pictures, :as => :imageble, :dependent => :destroy

	accepts_nested_attributes_for :pictures
	accepts_nested_attributes_for :locations

	validates_presence_of :name,message:"can't be empty"
	validates_presence_of :email,message:"can't be empty"
	validates_presence_of :phone,message:"can't be empty"

end
