Rails.application.routes.draw do
    resources :bblogs do
        collection do
            post :confirm
        end
    end
end
