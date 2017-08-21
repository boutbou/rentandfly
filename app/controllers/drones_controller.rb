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

    @drone = Drone.new(params_drone)
    @drone.user = current_user
    if @drone.save
      redirect_to dashboard_path
    else
      render "drones/new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private
  def params_drone
    params.require(:drone).permit(:brand, :model, :daily_price, :weekly_deal,
                                  :monthly_deal, :autonomy, :range,
                                  :controller, :deposit, :battery)
  end
end

