Rails.application.routes.draw do
  devise_for :user
  resources :patients
  resources :medicines
  resources :users
  resources :doctors
  resources :prescriptns
  resources :bookings
   root "user#wel"
   get "/main_home" => "patients#main_home"
   get "/doctor_main" => "user#doctor_main"
   get "/patients_notification" => "bookings#patients_notification"
   get "show_prescrition/:id" => "prescriptns#show_prescrition", as: :show_prescrition
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
