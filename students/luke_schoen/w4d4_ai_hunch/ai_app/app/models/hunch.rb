class Hunch < ActiveRecord::Base
	validates :name, presence: true 
	
	has_and_belongs_to_many :ideas

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE?', "%#{:search}%"])
		else
			find(:all)
		end
	end
end
