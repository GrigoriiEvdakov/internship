Rails.application.routes.draw do
  post 'students', to: 'students#create'

  resources :schools do
    resources :classes do
      resources :students, shallow: true
    end
  end
end
