Rails.application.routes.draw do

  namespace :admin do
    resources :notifications, only: [:index]
    # get 'notifications/index'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
  end

  namespace :admin do
    resources :tags, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :reports, only: [:show, :destroy]
    # get 'reports/show'
  end

  namespace :admin do
    root to: 'homes#top'
    # get 'homes/top'
  end

  scope module: :public do
    resources :notifications, only: [:index]
    # get 'notifications/index'
  end

  scope module: :public do
    resources :reports, only: [:new, :create, :index, :show, :destroy]
    # get 'reports/new'
    # get 'reports/index'
    # get 'reports/show'
  end

  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/reports' => 'customers#index'
    get 'customers/check' => 'customers#check'
    get 'customers/withdraw' => 'customers#withdraw'
    patch 'customers/withdraw' => 'customers#withdraw'

    # get 'customers/index'
  end

  scope module: :public do
    root to: 'homes#top'
  end

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
