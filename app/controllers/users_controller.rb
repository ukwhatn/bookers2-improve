class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @new_book = Book.new()
  end

  def index
    @users = User.all
    @new_book = Book.new()
  end
  
  def edit
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to user_path(current_user)
      return
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to user_path(current_user)
      return
    end
    
    if @user.update(user_params)
      flash[:notice] = "Your user info was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
