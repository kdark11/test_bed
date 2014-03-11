TestBed::Application.routes.draw do

  resources :posts
  
  root "pages#home"
  
  get "/home", to: "pages#home", as: "home"

end
