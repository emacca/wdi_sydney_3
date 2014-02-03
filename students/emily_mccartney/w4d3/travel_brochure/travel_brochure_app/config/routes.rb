TravelBrochureApp::Application.routes.draw do
  
  resources :destinations do
    resources :attractions, shallow:true
  end
    resources :attractions, only:[:index]
end
