Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :comments, only: [:create, :show] do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  root to: redirect("/subs")
end
