class Song < ActiveRecord::Base
    validates :name, presence: true 
    # error shown in front end when entering in form if not entered
	
	belongs_to :artist
	belongs_to :album
end
