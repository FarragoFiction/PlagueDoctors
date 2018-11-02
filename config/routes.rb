Rails.application.routes.draw do
  resources :paldemic_files do
    member do
      put 'upvote'
      put 'downvote'
      get 'random'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'paldemic_files#index'
end
