class Doctor < ApplicationRecord
	has_many :patients
	has_many :bookings
end
