# config/routes.rb
Rails.application.routes.draw do
  resources :brands do
    resources :texts do
      namespace :openai do
        resources :texts, only: :create
        post 'texts/score', to: 'texts#score'
        post 'texts/improve', to: 'texts#improve'
        post 'texts/finish', to: 'texts#finish'
        post 'texts/reduce', to: 'texts#reduce'
        post 'texts/increase', to: 'texts#increase'
        post 'texts/change', to: 'texts#change'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :brands, only: %i[index show create update destroy]
      resources :texts, only: %i[index show destroy]
      resources :prompts, only: %i[index show create update destroy]
      resources :tones, only: %i[index show create update destroy]
    end
  end
end
