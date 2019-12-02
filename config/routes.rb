Rails.application.routes.draw do
  root 'homepage#index'

  namespace :v1, constraints: { format: 'json' } do
    resources :contacts

  end

end
