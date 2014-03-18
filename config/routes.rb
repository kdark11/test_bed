TestBed::Application.routes.draw do

  resources :posts do
    resources :comments
  end
  root "pages#home"
  
  get "/home", to: "pages#home", as: "home"

end
