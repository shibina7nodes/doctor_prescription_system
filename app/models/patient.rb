class Patient < ApplicationRecord
	belongs_to :bookings
	belongs_to :doctors
	validates :p_name, presence: { message: "must be given please" }
	validates :p_gender, presence: { message: "must be given please" }
	validates :p_address, presence: { message: "must be given please" }
	validates :p_age, numericality: { message: "must be given please" }
	validates :p_mobno, numericality: {only_integer: true}, length: { is: 10} 
	def self.search(search)
  where("p_name LIKE ? ", "%#{search}%") 
	end
end
