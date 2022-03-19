Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :proofs do
    collection do
      post :first_exercise
      post :second_exercise
    end
  end
end