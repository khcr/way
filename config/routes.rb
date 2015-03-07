Rails.application.routes.draw do

  root to: 'pages#home'

  get '/presentation', to: 'pages#vision'
  get '/liens', to: 'pages#links'
  get '/contact', to: 'pages#contact'
  get '/programme', to: 'events#index'
  get '/profile', to: 'admin/users#profile'
  get '/worship', to: 'pages#worship'

  get '/login', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  get "/404", :to => "errors#error_404"
  get "/422", :to => "errors#error_404"
  get "/500", :to => "errors#error_500"

  resources :forms, only: [:create], path: '/inscriptions'
  get '/inscription', to: 'forms#new'
  
  namespace :admin do
    resources :galleries, except: [:show] do
      resources :paintings, except: [:show]
    end
    resources :events, except: [:show] 
    resources :news, except: [:show]
    resources :pages, except: [:show]
    resources :projects, except: [:show]
    resources :users, except: [:show]
    resources :images, except: [:show]
    resources :slideshows, except: [:show]
    resources :forms, only: [:index, :destroy] do
      collection do
        post 'reset'
      end
    end
  end

  resources :galleries, only: [:index, :show, :create], path: '/medias'
  resources :sessions, only: [:create, :destroy]
  resources :projects, only: [:show, :index], path: '/activites'
  resources :events, only: [:show, :index]

end