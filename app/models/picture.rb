class Picture < ApplicationRecord
	mount_uploader :image, ImageUploader # used for carrierwave gem
	belongs_to :imageble, :polymorphic => true
	validates_presence_of :image,message:"can't be empty"
end
