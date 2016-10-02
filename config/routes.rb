Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'index#welcome'
  get 'msquare', to: 'magic_square#index', as: :magic_square

end
