Rails.application.routes.draw do
  devise_for :users
  resources :patients
  resources :medicines
  resources :users
  resources :doctors
  resources :prescriptns
  resources :bookings
  resources :conversations do
   resources :messages
 end
    resources :conversations 
     resources :messages
  # resources :sessions, only: [:new, :create]

  # root 'sessions#new'
   root "user#wel"
   get "/main_home" => "patients#main_home"
   get "/chatbox" => "user#chatbox"
   get "/doctor_main" => "user#doctor_main"
   get "/patients_notification" => "bookings#patients_notification"
   get "show_prescrition/:id" => "prescriptns#show_prescrition", as: :show_prescrition
  
   mount ActionCable.server => '/cable'
end
