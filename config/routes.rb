Rails.application.routes.draw do
  resources :images, only: %w[show create]
end
