class Patient < ApplicationRecord
	has_many :bookings, dependent: :destroy 
	belongs_to :doctor

		
	validates :p_name, presence: { message: "name must be given please" }
	validates :p_gender, presence: { message: "gender must be given please" }
	validates :p_address, presence: { message: "address must be given please" }
	validates :p_age, numericality: { message: "age must be given please" }
	validates :p_mobno, numericality: {only_integer: true, message: "mobile number must be given please" }, length: { is: 10} 
	def self.search(search)
  where("p_name LIKE ? ", "%#{search}%") 
	end
end
