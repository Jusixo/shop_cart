Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'products/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
