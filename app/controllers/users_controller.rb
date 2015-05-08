class UsersController < ApplicationController
  before_action :current_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    @user = User.new(user_params)

    email_address = params[:user][:email].downcase
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "http://www.gravatar.com/avatar/#{hash}?d=retro"
    @user.gravatar = image_src

    if @user.save
      sign_in @user
      flash[:success] = "Registration successful! Welcome to Swear for Charity!"
      redirect_to :mains
    else
      flash[:errors_array] = @user.errors.full_messages
      redirect_to 'users/new'
    end
  end

  def edit
  end

  def update
    if @current_user.update(profile_params)
      flash[:success] = "Profile updated!"
      redirect_to :mains
    else
      flash[:errors_array] = @user.errors.full_messages
      redirect_to(:back)
    end
  end

  def destroy
  end

  private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)      
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name)  
    end

end
