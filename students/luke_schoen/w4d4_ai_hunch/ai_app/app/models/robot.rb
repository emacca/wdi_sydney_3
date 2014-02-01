class Robot < ActiveRecord::Base
	validates :name, presence: true 
	
	has_many :senses
	has_many :ideas
end
