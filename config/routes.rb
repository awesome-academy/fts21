Rails.application.routes.draw do
  root "activities#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  namespace :trainee do
    root "courses#index"
    resources :user_courses, only: :show
    resources :course_subjects, only: :show
    resources :user_subjects, only: :show do
      member do
        patch "finish"
      end
      resources :tasks, only: :show do
        member do
          post "report"
          patch "finish"
        end
      end
    end
  end
  resources :courses do
    member do
      get "assign_trainee"
      post "add_trainee"
      post "start"
      patch "finish"
      delete "delete_trainee"
    end
  end
  resources :subjects do
    resources :tasks, except: %i(index show)
  end
  resources :course_subjects, only: :show do
    member do
      patch "finish"
      patch "start"
    end
  end
end
