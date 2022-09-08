Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#home"

  # match 'static_pages/home/' => 'static_pages#home', :via => :get
  get 'static_pages/home', to: 'static_pages#home'
end
