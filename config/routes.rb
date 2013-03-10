Way::Application.routes.draw do

  mount Mercury::Engine => '/'

  root to: 'pages#home'

  match '/vision', to: 'pages#vision'
  match '/liens', to: 'pages#links'
  match '/contact', to: 'pages#contact'
  match '/programme', to: 'events#index'
  match '/admin', to: 'admin::pages#admin_index'

  match '/login', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  scope(:path_names => { :new => "nouveau", :edit => "edition" }) do
  
    namespace :admin do
      resources :galleries, except: [:show] do
        resources :paintings, except: [:show]
      end
      resources :events, except: [:show] 
      resources :news, except: [:show]
      resources :pages do
        member { post :mercury_update }
      end
      resources :projects, except: [:show] do
        member { post :mercury_update }
      end 
      resources :users, except: [:show]
      resources :images
    end

    resources :galleries, only: [:index, :show], path: '/medias'
    resources :sessions, only: [:create, :destroy]
    resources :projects, only: [:show], path: '/projets'
    resources :events

  end
  
end
