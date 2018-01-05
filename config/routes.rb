Rails.application.routes.draw do
   get "/bblogs/home/index" , to: "home#index"
#   root to: "home#index"

    resources :bblogs do
        collection do
            post :confirm
        end
    end
    
end
