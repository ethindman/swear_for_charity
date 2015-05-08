class MainsController < ApplicationController
  before_action :current_user

  def index
  	@users = User.all.where.not(id: @current_user.id)
    @current_mission = @current_user.missions.first
  end

  def show
  end

  def profile
  	@missions = Mission.where(user_id: @current_user.id)
  	@invitations = Friendship.where(friend_id: @current_user.id, status: false).includes(:user)
  	@friends = Friendship.where(friend_id: @current_user.id, status: true)
  end

  def about  	
  end

  def search
  	@users = User.all.where.not(id: @current_user.id)
  	@friends = Friendship.all
  end

end
