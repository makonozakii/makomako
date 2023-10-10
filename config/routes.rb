Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dogs/lion' => 'dogs#lion'
  resources :dogs 
  resources :nozas do
    resources :comments, only: [:create]
  end

  root 'dogs#cat'

end
