class UsersController < ApplicationController
  def new #form to make new user
    @user = User.new
  end

  def create #restful route to make new user!
    @user = User.new( user_params )
    if @user.save
      sign_in @user
      flash[:enter_success] = 'Welcome, '+@user.first_name+"! Your account has been created."
      redirect_to @user
    else
      flash[:register_errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])

    @message = Message.new
    @comment = Comment.new

    @messages = Message.all.order('created_at DESC')
    @comments = Comment.all.order('created_at ASC')
  end

  #define strong parameters!
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end