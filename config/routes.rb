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
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
