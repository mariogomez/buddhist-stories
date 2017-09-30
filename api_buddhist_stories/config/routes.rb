Rails.application.routes.draw do
  
  scope :format => true, :constraints => { :format => 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"
  end

  resources :registrations
  resources :users
  resources :story_contents
  resources :stories
  resources :accounts
  resources :languages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
