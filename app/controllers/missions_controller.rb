class MissionsController < ApplicationController
  before_action :current_user

  def index
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
  end

  def create
    @mission = @current_user.missions.new(mission_params)
    @mission.current_balance = 0.00
    @mission.total_balance = 0.00
    @mission.payments_made = 0
    @mission.goal_reached = false
    @mission.status = false

    if @mission.save
      flash[:success] = "WORKED"
      redirect_to :mains
    else
      flash[:errors] = "Failed"
      redirect_to(:back)
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @amount = params[:amount].to_f
    
    @mission = Mission.find(params[:id])
    
    @mission.update_attribute("payments_made", @mission.payments_made + 1)

    @mission.update_attribute("total_balance", @mission.total_balance + @amount)

    @mission.update_attribute("current_balance", @mission.current_balance + @amount)

    @update = Update.create(user_id: @current_user.id, amount: @amount)

    redirect_to :mains
  end

  def destroy
  end

  private
    def mission_params
      params.require(:mission).permit(:bad_habit, :target_deadline, :charity, :contribution_goal)
    end
end
