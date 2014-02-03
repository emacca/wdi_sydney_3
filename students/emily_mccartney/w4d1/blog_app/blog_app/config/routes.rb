BlogApp::Application.routes.draw do
  resources :posts

  root :to => 'pages#home'
end
