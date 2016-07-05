Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :messages
  resources :text_messages

  root to: 'messages#index'
end
