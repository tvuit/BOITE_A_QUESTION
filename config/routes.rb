Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  devise_for :users
  root to: 'questions#index'
  get 'live_index', to: "questions#live_index", as: :live_index
  resources :questions do
     member do
    put "like", to: "questions#upvote"
    put "dislike", to: "questions#downvote"
    put "archive", to: "questions#archive"
  end
  end

end
