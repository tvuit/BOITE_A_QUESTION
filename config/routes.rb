Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => "/cable"
  devise_for :users
  root to: 'questions#index'
  get 'wiki', to: "pages#wiki", as: :wiki
  get 'welcome', to: "pages#welcome", as: :welcome
  get 'live_index', to: "questions#live_index", as: :live_index
   get 'archives', to: "questions#archives", as: :archives
  resources :questions do
     member do
    put "like", to: "questions#upvote"
    put "dislike", to: "questions#downvote"
    put "archive", to: "questions#archive"
  end
  end

end
