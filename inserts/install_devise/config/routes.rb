
devise_for(
  :users,
  only: :omniauth_callbacks,
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
)

scope '(:locale)', locale: /en|cs/ do
  devise_for :users, skip: :omniauth_callbacks

  namespace :admin do
    get :system_test, to: 'system_test#index'

    root to: 'dashboard#index'
  end

  get '/:locale', to: 'homepage#index'

  root to: 'homepage#index'
end