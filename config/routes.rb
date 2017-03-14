Rails.application.routes.draw do
  root 'search#new'
  post '/', to:'search#create'
end
