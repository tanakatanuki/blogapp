class BblogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:new, :edit, :show, :destroy]

    def index
        @bblogs = Bblog.all
#        binding.pry
#        raise
    end
    
    def new
        if params[:back]
            @bblog = Bblog.new(blog_params)
        else
            @bblog = Bblog.new
        end
    end
    
    def create
#        Bblog.create(name: params[:bblog][:title], content: params[:bblog][:content])
#        Bblog.create(params.require(:bblog).permit(:name, :content))
#        Bblog.create(blog_params)
        @bblog = Bblog.new(blog_params)
        @bblog.user_id = current_user.id
        # キャッシュから画像を復元
        @bblog.image.retrieve_from_cache! params[:cache][:image]
        if @bblog.save
            redirect_to bblogs_path, notice: "ブログを作成しました"
        else
#            redirect_to new_bblog_path
            render "new"
        end
    end
    
    # 詳細ページが呼び出されたとき、blog記事とお気に入りを取得する
    def show
        # @bblog = Bblog.find(params[:id])
        @favorite = current_user.favorites.find_by(bblog_id: @bblog.id)
    end
    
    def edit
        # @bblog = Bblog.find(params[:id])
    end
    
    def update
        # @bblog = Bblog.find(params[:id])
        if @bblog.update(blog_params)
            redirect_to bblogs_path, notice:"編集しました"
        else
            render "edit"
        end
    end
    
    def destroy
        @bblog.destroy
        redirect_to bblogs_path, notice:"削除したよ"
    end
    
    def confirm
        @bblog =Bblog.new(blog_params)
        render :new if @bblog.invalid?
    end
    
    private
    
    def blog_params
        params.require(:bblog).permit(:name, :content, :image)
    end
    
    def set_blog
        @bblog = Bblog.find(params[:id])
    end
    
    # カレントユーザーが存在しない場合、強制的にログイン画面にリダイレクト
    def correct_user
        if !logged_in?
            flash[:warning] = "ログインしてください"
            redirect_to new_session_path
        end
    end
end
