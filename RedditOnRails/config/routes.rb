Rails.application.routes.draw do

  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  resources :comments, only: [:create, :show]

  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end

  root to: redirect("/subs")
end
