class DronesController < ApplicationController

  def index
    # possibilité d'un if pour conditionner une selection de l'index
    # en fonction d'un paramettre de recherche
    @drones = Drone.all
  end

  def show
  end

  def new
    @drone = Drone.new
  end

  def create
    @drone = Drone.new(params_drone_create)
    @drone.user = current_user
    if @drone.save
      redirect_to dashboard_path
    else
      render "drones/new"
    end
  end

  def edit
    @drone = Drone.find(params[:id])
  end

  def update
    @drone = Drone.find(params[:id])
    @drone.update(params_drone_update)
    redirect_to dashboard_path
  end

  def destroy
  end

  def search
  end

  private
  def params_drone_create
    params.require(:drone).permit(:brand, :model, :daily_price, :weekly_deal,
                                  :monthly_deal, :autonomy, :range,
                                  :controller, :deposit, :battery)
  end

  def params_drone_update
    params.require(:drone).permit(:brand, :model, :daily_price, :weekly_deal,
                                  :monthly_deal, :autonomy, :range,
                                  :controller, :deposit, :battery, :available)
  end
end

