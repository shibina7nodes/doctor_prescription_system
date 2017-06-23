class Doctor < ApplicationRecord
	has_many :patients, through: :bookings, dependent: :destroy
	has_many :bookings, dependent: :destroy
	has_many :messages, dependent: :destroy
	has_many :conversations, foreign_key: :sender_id, dependent: :destroy
	validates :d_name, presence: { message: "name must be given please" }
	validates :d_gender, presence: { message: "gender must be given please" }
	validates :d_address, presence: { message: "address must be given please" }
	validates :d_mobno, numericality: { message: "age must be given please" }
	validates :d_specialize, presence: { message: "specialization must be given please" }
	validates :email, presence: { message: "email must be given please" }

	def show_online
		User.current_sign_in_at >= 15.minutes.ago
	end
end
