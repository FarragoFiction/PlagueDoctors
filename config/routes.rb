Rails.application.routes.draw do
  devise_for :users
  resources :paldemic_files do
    member do
      put 'upvote'
      put 'downvote'
    end

    collection do
      get 'random'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'paldemic_files#index'

  # Routes for Google authentication
  get "auth/:provider/callback", to: "sessions#googleAuth"
  get "auth/failure", to: redirect("/")
end
