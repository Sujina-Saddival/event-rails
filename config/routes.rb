Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
   devise_for :users, path: "api/v1/accounts", controllers: {
    :registrations 				=> 'api/v1/accounts/registrations',
    :sessions					=> 'api/v1/accounts/sessions'
  }

end
