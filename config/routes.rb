Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  devise_for :users
  root to: 'questions#index'
  resources :questions do
     member do
    put "like", to: "questions#upvote"
    put "dislike", to: "questions#downvote"
  end

  end

end
