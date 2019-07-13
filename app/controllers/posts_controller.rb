class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    
    def create
        Post.create(post_params)
        redirect_to root_path
    end

    def show
    end

    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:description, :image, :user_id)
        end
end
