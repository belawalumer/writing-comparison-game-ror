Rails.application.routes.draw do
  root :to => "scripts#home"
  resources :scripts 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
