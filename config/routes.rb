DevToolsApp::Application.routes.draw do

  resources :users, only: [:index, :show, :create, :new]
  resources :tools, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :categories, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :welcome, only: [:index]
  resource :auth, only: [:create]

  get 'login' => 'auths#new'
  delete 'logout' => 'auths#destroy'

  root 'welcome#index'  

end
