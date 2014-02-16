DevToolsApp::Application.routes.draw do

  root 'tools#index'  

  get 'login' => 'auths#new'
  delete 'logout' => 'auths#destroy'

  get 'tools/list', :to => "tools#list"

  resources :users, only: [:index, :show, :create, :new]
  resources :tools, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :categories, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :welcome, only: [:index]
  resource :auth, only: [:create]

end
