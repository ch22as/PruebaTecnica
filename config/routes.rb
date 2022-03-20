Rails.application.routes.draw do
  resources :comunicados do
    collection do
      post :releases_legal_age_people_with_attachments_number
    end
  end
  resources :adjuntos
  resources :personas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :proofs do
    collection do
      post :first_exercise
      post :second_exercise
    end
  end
end
