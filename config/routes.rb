Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/test'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "messages/from/:user_name", to: "messages#from", as: :messages_from_user
  get "messages/for/:wxuin", to: "messages#for", as: :messages_for_user
end
