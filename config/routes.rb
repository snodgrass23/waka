Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  # Onboarding wizard
  get 'onboarding(/:step)', to: 'onboarding#show', as: :onboarding
  patch 'onboarding/:step', to: 'onboarding#update', as: :onboarding_update
end
