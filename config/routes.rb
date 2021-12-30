Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: %i[show create] do
    member do
      post :some_action
    end
  end
end
