Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  resources :restaurants do 
    resources :dishes, only: %i(new create) # %i crea array de simbolos, %w crea array de strings
  end

end
# ruta => controlador#accion => vista(template)