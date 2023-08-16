# config/routes.rb
Rails.application.routes.draw do
  resources :brands do
    resources :texts do
      namespace :openai do
        resources :texts, only: :create
      end
    end
  end
end
