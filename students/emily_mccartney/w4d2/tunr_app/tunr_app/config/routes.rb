TunrApp::Application.routes.draw do


  resources :playlists

  resources :artists do
    resources :albums, shallow: true
    resources :songs, shallow: true
    
  end

 

  root :to => 'pages#home'
  

  resources :songs, only: [:index]
  resources :albums, only: [:index]


  resources :albums do 
    resources :songs
  end
  
  get ':action' => "pages#:action"
  
end
