Rails.application.routes.draw do
  resources :story_contents
  resources :stories
  resources :accounts
  resources :languages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
