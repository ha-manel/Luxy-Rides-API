Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  #Redirect to api-docs
  get '*path', to: redirect('/api-docs')

  post 'api/v1/register/:username/:name/:email', to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'

  get 'api/v1/cars', to: 'cars#index'
  get 'api/v1/car/:id', to: 'cars#show'
  post 'api/v1/car', to: 'cars#create'
  delete 'api/v1/car/:id', to: 'cars#delete'
  get 'api/v1/reserve/cars/:date', to: 'cars#reserve'
  get 'api/v1/cars/:user_id', to: 'cars#user_cars' 

  post 'api/v1/reservation/:user_id/:car_id/:city/:date', to: 'reservations#create'
  get 'api/v1/reservations/:user_id', to: 'reservations#index'
end
