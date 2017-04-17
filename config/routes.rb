Rails.application.routes.draw do
  root to: "links#index"
  
  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create]
    end
  end
end
