Rails.application.routes.draw do
    # トップページ用
    get "/bblogs/home/index" , to: "home#index"
    #   root to: "home#index"

    # ユーザー情報管理
    resources :users, only:[:new, :create, :show]
    
    # ログイン機能
    resources :sessions, only:[:new, :create, :destroy]
    
    # ブログ機能
    resources :bblogs do
        collection do
            post :confirm
        end
    end
    
    # お気に入り機能
    resources :favorites, only:[:create, :destroy]
    
end
