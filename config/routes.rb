Rails.application.routes.draw do
  resources :users do
    get 'email_confirmation', on: :collection
  end
  root 'users#index'
end
