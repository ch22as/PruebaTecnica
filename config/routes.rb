Rails.application.routes.draw do
  resources :comunicados do
    collection do
      get :releases_legal_age_people_with_attachments_number
    end
  end
  # resources :adjuntos
  # resources :personas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :proofs do
    collection do
      get :first_exercise
      get :second_exercise
    end
  end

  root 'proofs#index'
end
