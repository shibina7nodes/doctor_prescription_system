class UserController < ApplicationController
	before_filter :authenticate_user!

	def wel
	end

	def doctor_main
		@user =User.with_role(:doctor)
	end
	
	def pass_reset
		
	end

	def chatbox
		
	end

	def index
    	@users = User.where.not("id = ?",current_user.id).order("created_at DESC")
     	@conversations = Conversation.involving(current_user).order("created_at DESC")
  	end

	def update
 	@conversation = Conversation.find(params[:id])

 	if @conversation.update(conversation_params)
   		redirect_to @conversation
 	else
    	render 'index'
 	end

	end

	private
	def conversation_params
 		params.permit(:sender_id, :recipient_id)
 	end
end
