class User < ApplicationRecord
	belongs_to :bookings
	has_one :doctor
  rolify
	resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :rememberable, :trackable, :validatable,
   		 :timeoutable
end
