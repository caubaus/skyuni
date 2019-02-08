Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_up => 'signup',:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
              :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  get 'pages/about'

  root 'pages#about' #make home-page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
