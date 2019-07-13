class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    def show
        @posts = @user.posts.order(created_at: :desc)
    end

    def edit
        unless @user == current_user
            flash[:danger] = "You can only edit your own profile"
            redirect_to user_path(@user)
        end
    end

    def update
        if @user.update(user_params)
            flash[:success] = "User is successfully updated"
            redirect_to current_user
        else
            flash.now[:danger] = "Something went wrong. Please try again"
        end
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar)
        end
end