Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :path => '', :path_names => {:sign_up => 'signup',:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
              :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  get 'pages/about'

  root 'course#index' #make home-page

  resources :course do
    resources :lecture, only: [:show] #nested resouces
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
