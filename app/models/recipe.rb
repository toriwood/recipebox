class Recipe < ActiveRecord::Base
	has_many :ingredients


	validates :name, presence: true
	validates :instructions, presence: true
end
