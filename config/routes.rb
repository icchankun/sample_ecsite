Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resource :customers, only: [:edit, :update] do
      collection do
        get 'confirm'
        patch 'withdraw'
      end
    end
    get 'customers/mypage' => 'customers#show'

    resources :items, only: [:index, :show]
    
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
    resources :orders, only: [:index, :new, :show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  namespace :admin do
    get '/' => 'homes#top'
    
    resources :customers, only: [:index, :show, :edit, :update]
    
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    
    resources :genres, only: [:index, :create, :show, :edit, :update]
    
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
