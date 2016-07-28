Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'about#whoweare'
  get 'about/whoweare'
  get 'about/brandpromise'
  get 'about/news'
  get 'about/article'
  get 'northside-introduces-new-kids-winter-boots' => 'about#article1'
  get 'northside-unveils-on-trend-new-womens-cold-weather-lifestyle-boots' => 'about#article2'
  get 'northside-project-sole' => 'about#article3'
  get 'northside-expands-trail-line-to-meet-more-needs-than-ever-before' => 'about#article4'

  get 'productlist' => 'productlist#index'
  get 'productlist/mens'
  get 'productlist/kids'
  get 'productlist/collection'
  get 'productmodal' => 'productmodal#index'
  get 'productdetail' => 'productdetail#index'
  get 'productdetail/:id' => 'productdetail#show'

  #resources :products, only: [:index, :show, :men]
  get 'products' => 'products#index'
  get 'men' => 'products#men'
  get 'women' => 'products#women'
  get 'kids' => 'products#kids'
  get 'products/men' => 'products#men'
  get 'products/women' => 'products#women'
  get 'products/kids' => 'products#kids'
  get 'men/active' => 'products#men_active'
  get 'men/hunting' => 'products#men_hunting'
  get 'men/lifestyle' => 'products#men_lifestyle'
  get 'men/slippers' => 'products#men_slippers'
  get 'men/sport' => 'products#men_sport'
  get 'men/trail' => 'products#men_trail'
  get 'men/watershoes' => 'products#men_watershoes'
  get 'women/active' => 'products#women_active'
  get 'women/hunting' => 'products#women_hunting'
  get 'women/lifestyle' => 'products#women_lifestyle'
  get 'women/slippers' => 'products#women_slippers'
  get 'women/sport' => 'products#women_sport'
  get 'women/trail' => 'products#women_trail'
  get 'women/watershoes' => 'products#women_watershoes'
  get 'kids/active' => 'products#kids_active'
  get 'kids/hunting' => 'products#kids_hunting'
  get 'kids/lifestyle' => 'products#kids_lifestyle'
  get 'kids/slippers' => 'products#kids_slippers'
  get 'kids/sport' => 'products#kids_sport'
  get 'kids/trail' => 'products#kids_trail'
  get 'kids/watershoes' => 'products#kids_watershoes'
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:create, :update, :destroy]
  get 'orders/thankyou/:id' => 'orders#thankyou'

  get 'cart' => 'cart#index'

  get 'checkout' => 'checkout#show'
  get 'checkout/shipping'
  get 'checkout/billing'
  get 'checkout/delivery'
  get 'checkout/payment'
  get 'checkout/review'
  post 'checkout/pay'

  get 'order' => 'order/index'
  get 'order/index'
  get 'order/thankyou'
  post 'order/update'

  get 'returns' => 'returns#index'

  get 'termsofservice' => 'info#termsofservice'

  get 'privacypolicy' => 'info#privacypolicy'

  get 'contactus' => 'contact_us#index'

  get 'customerservice' => 'contact_us#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
