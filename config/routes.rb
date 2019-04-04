Rails.application.routes.draw do
  resources :caretakers
  resources :time_holes do
    collection do
      post 'TIMEHOLE'
      get 'adoptTIMEHOLE'
      post 'abdicateTIMEHOLE'
      get 'timeholesize'
    end
  end
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


end
