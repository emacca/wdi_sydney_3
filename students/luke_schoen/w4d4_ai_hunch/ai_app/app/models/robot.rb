class Robot < ActiveRecord::Base
	validates :name, presence: true 
	
	has_many :senses, :dependent => :nullify #:destroy, 
	has_many :ideas, :dependent => :nullify
end
