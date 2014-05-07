Rails.application.routes.draw do
  root to: 'pivotal#index'
  get '/pivotal/show', to: 'pivotal#show'
end
