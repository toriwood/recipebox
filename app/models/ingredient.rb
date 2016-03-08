class Ingredient < ActiveRecord::Base
	belongs_to :recipe

	validates :name, presence: true
	validates :quantity, presence: true
	validates :recipe_id, presence: true
end
