Rails.application.routes.draw do
  resources :paldemic_files
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'paldemic_files#index'
end
