MomaApp::Application.routes.draw do
  
  resources :artists do
    resources :paintings
  end
  
  resources :paintings

  root :to => 'pages#home' #specifying a home page, u need a controller and also a folder in views to make it work.

end
