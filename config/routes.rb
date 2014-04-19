Rails.application.routes.draw do
  namespace :admin do
    resources :categories, except: [:show]
    resources :games, except: [:show]
  end

  root to: 'games#index'
end
