class User < ApplicationRecord
	belongs_to :bookings
	has_one :doctor
	has_many :conversations, :foreign_key => :sender_id
	after_create :create_default_conversation
  rolify
	resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :timeoutable

   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  
 def name
  d= Doctor.find_by(email: email)
  if d 
    d.d_name
  else
    email
  end
 end

  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end
end
