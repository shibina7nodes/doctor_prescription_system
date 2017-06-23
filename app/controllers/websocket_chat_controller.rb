# WebsocketRails :: BaseController inheritance 
class WebsocketChatController < WebsocketRails::BaseController 
	
	def  message_recieve
 
　　# get the message from the client 

　　recieve_message = message () 
WebSocketRails [:websocket_with_channel].trigger(:websocket_chat, message) 



　　

　 

  end 
end


