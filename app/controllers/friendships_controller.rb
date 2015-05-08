class FriendshipsController < ApplicationController
  before_action :current_user

  def create
  	@friend = Friendship.new(friend_params)
  	@friend.user_id = @current_user.id
  	if @friend.save
  		flash[:success] = "Iniviation sent"
  		redirect_to(:back)
  	else
  		flash[:errors] = "Something went wrong"
  		redirect_to(:back)
  	end
  end

  def update
  	@friendship = Friendship.find_by(user_id: params[:id], friend_id: @current_user.id).update(status: true);

  	@friendship2 = Friendship.create(user_id: @current_user.id , friend_id: params[:id], status: true)

  	if @friendship && @friendship2
  		flash[:success] = "Now you're friends!"
  		redirect_to(:back)
  	else
  		flash[:errors] = "Something went wrong"
  		redirect_to(:back)
  	end
  end

  def destroy
  	@check1 = Friendship.find_by(user_id: params[:id], friend_id: @current_user.id)
  	@check2 = Friendship.find_by(user_id: @current_user.id, friend_id: params[:id])
 
  	if @check1 && @check2
  		@check1.destroy
  		@check2.destroy
  		flash[:success] = "Now you are no longer friends"
  		redirect_to(:back)
  	else
  		flash[:errors] = "Something went wrong"
  		redirect_to(:back)
  	end
  end

  private
  def friend_params
    params.require(:friend).permit(:friend_id)
  end
end
