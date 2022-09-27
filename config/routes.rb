Rails.application.routes.draw do
  post 'api/v1/register/:username/:name/:email', to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'

  get 'api/v1/cars', to: 'cars#index'
  post 'api/v1/car/:user_id/:model/:picture/:driver_name', to: 'cars#create'
  delete 'api/v1/car/:id', to: 'cars#delete'
  get 'api/v1/reserve/cars/:date', to: 'cars#reserve'

  post 'api/v1/reservation/:user_id/:car_id/:city/:date', to: 'reservations#create'
  get 'api/v1/reservations/:user_id', to: 'reservations#index'
end
