Rails.application.routes.draw do
  resources :all_seeing_eyes
  resources :tombstone_timeholds do
    member do
      put 'upvote'
      put 'downvote'
    end

    collection do
      get 'getRandomSet'
      post 'createFromLOMAT'
      put 'updateFromLOMAT'
    end
  end
  resources :caretakers do
    collection do
      post 'confirmedLogin' #give me a username and password and i'll return if it exists or not
      post 'idFromLogin'
    end
    member do
      post 'upvote'
      post 'downvote'
    end
  end
  resources :time_holes do
    collection do
      post 'TIMEHOLE'
      post 'adoptTIMEHOLE'
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
