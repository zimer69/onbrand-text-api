# config/routes.rb
Rails.application.routes.draw do
  resources :brands do
    resources :texts do
      namespace :openai do
        resources :texts, only: %i[create score improve finish reduce increase change]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :brands, only: %i[index show]
      resources :texts, only: %i[score improve finish reduce increase change]
      resources :prompts, only: %i[index show]
      resources :tones, only: %i[index show]
    end
  end
end
