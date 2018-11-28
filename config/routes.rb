Rails.application.routes.draw do

  devise_for :users
  root to: 'spots#index'

  resources :spots
  
  resources :users, :only => [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
