class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :set_post, only: [:show, :destroy]
    before_action :require_same_user, only: [:destroy]
    
    def create
        Post.create(post_params)
        redirect_to root_path
    end

    def show
    end

    def destroy
        if @post.destroy
            redirect_to user_path(current_user)
        else
            flash[:danger] = "Something went wrong. Please try deleting the post again."
        end
    end

    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:description, :image, :user_id)
        end

        def require_same_user
            unless current_user == @post.user
                flash[:danger] = "You can only remove your own posts"
                redirect_to post_path(@post)
            end
        end
end
