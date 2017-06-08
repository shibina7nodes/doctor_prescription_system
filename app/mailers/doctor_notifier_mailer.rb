class DoctorNotifierMailer < ApplicationMailer		
	default :from => 'exercise41251@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(doctor)
    @user = doctor
    mail( :to => @user,
    :subject => 'Thanks for signing up for our amazing app' )
  end

end
