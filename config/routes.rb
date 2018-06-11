Rails.application.routes.draw do
  root 'welcomes#show'
   get 'search',to: "assignments#search"
   get 'institution',to: "assignments#institution"
   get 'semdate',to: "assignments#semdate"
   get 'uoe', to: redirect('http://uoeld.ac.ke')
  resources :welcome
  devise_for :users
	resources :assignments
 authenticated :user do
	   root 'assignments#index', as: :authenticated_root
 end

end
