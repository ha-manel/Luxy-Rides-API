Rails.application.routes.draw do
  post 'api/v1/register/:username/:name/:email', to: 'users#register'
  get 'api/v1/login/:username', to: 'users#login'
end
