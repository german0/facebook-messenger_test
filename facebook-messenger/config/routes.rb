Rails.application.routes.draw do
  resources :facebook_bot,
    controller: "messenger",
    only: [:index, :create]
end
