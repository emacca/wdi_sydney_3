class Sense < ActiveRecord::Base
	validates :name, :robot_id, presence: true 
	
	has_many :ideas
	belongs_to :robot
end
