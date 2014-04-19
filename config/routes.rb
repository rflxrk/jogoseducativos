Rails.application.routes.draw do
  namespace :admin do
    resources :categories, except: [:show]
    resources :games, except: [:show]
  end

  root to: 'games#index'

  resources :games, path: '', only: [:show] do
    get 'pagina-:page', action: :index, on: :collection
  end
end
