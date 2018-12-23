Rails.application.routes.draw do

  root 'spots#index'

  devise_for :users

  resources :spots do
    resources :comments
    member do
      get :likes
      get :show_image
    end
  end
    
  resources :users, :only => [:show]

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
