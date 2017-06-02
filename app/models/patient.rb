class Patient < ApplicationRecord
	belongs_to :bookings
	belongs_to :doctors

	def self.search(search)
  where("p_name LIKE ? ", "%#{search}%") 
	end
end
