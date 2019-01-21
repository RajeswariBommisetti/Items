Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "item_categories#index"
  resources :item_categories
  resources :items do
    get :tax_details, on: :collection
  end
  resources :item_taxes

end
