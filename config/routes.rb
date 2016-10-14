Rails.application.routes.draw do
  get 'facebook/uploadImg'
  get  'callback' ,to: 'facebook#callback'

  get 'app/index'

  post 'photo/create'
  get 'photo/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
