Way::Application.routes.draw do

  root to: 'pages#home'

  match '/vision', to: 'pages#vision'
  match '/liens', to: 'pages#links'
  match '/contact', to: 'pages#contact'
  match '/programme', to: 'events#index'

  match '/login', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/admin', to: 'pages#admin_index'
  match '/admin/programme', to: 'events#admin_index'
  match '/admin/galleries', to: 'galleries#admin_index'
  match '/admin/projets', to: 'projects#admin_index'
  match '/admin/news', to: 'news#admin_index'

  scope(:path_names => { :new => "nouveau", :edit => "edition" }) do
  
    resources :galleries, only: [:index, :show]
    resources :sessions, only: [:create, :destroy]
    resources :projects, only: [:show]

    scope "/admin" do
      resources :news, except: [:show, :index], path: '/articles'
      resources :users, except: [:show]
      resources :pages, except: [:show]
      resources :events, except: [:show, :index]
      resources :projects, except: [:show,:index], path: '/projets'
      resources :galleries, except: [:index, :show] do 
        resources :paintings, except: [:index, :show]
      end
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
