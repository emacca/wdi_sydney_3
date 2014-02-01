class Sense < ActiveRecord::Base
	validates :name, presence: true 
	
	has_many :ideas
	belongs_to :robot
end
