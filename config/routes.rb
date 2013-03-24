Way::Application.routes.draw do

  mount Mercury::Engine => '/'

  root to: 'pages#home'

  match '/presentation', to: 'pages#vision'
  match '/liens', to: 'pages#links'
  match '/contact', to: 'pages#contact'
  match '/programme', to: 'events#index'
  match '/admin', to: 'admin::pages#admin_index'

  match '/login', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match "/404", :to => "errors#error_404"
  match "/422", :to => "errors#error_404"
  match "/500", :to => "errors#error_500"

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
      resources :images, except: [:show]
      resources :slideshows, except: [:show]
      resources :members, except: [:show]
    end

    resources :galleries, only: [:index, :show], path: '/medias'
    resources :sessions, only: [:create, :destroy]
    resources :projects, only: [:show, :index], path: '/activites'
    resources :events, only: [:show, :index], :constraints => {:id => /(?:[a-z]|-)*/}

  end

  match "/events/:id" => redirect {|params| "/events/" + Event.find(params[:id]).slug }
  
end
