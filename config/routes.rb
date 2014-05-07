Rails.application.routes.draw do
  root to: 'pivotal#index'
  get '/pivotal/show', to: 'pivotal#show'
  get '/pivotal/show/:id', to: 'pivotal#project', :as => 'project_id'
end
