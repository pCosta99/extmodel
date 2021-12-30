Rails.application.routes.draw do
  root 'home#index'

  resources :ext_resources, only: %i[show create] do
    member do
      post :some_action
    end
  end
end
