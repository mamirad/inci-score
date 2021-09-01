Rails.application.routes.draw do
  resources :file_records do
    member do
      get 'inci_score'
    end

    collection do
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "file_records#index"
  # root "home#index"
  root "file_records#index"
  # get '/inci_score', to: 'file_records#inci_score', as: 'inci_score'
end
