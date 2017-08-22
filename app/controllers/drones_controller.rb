class DronesController < ApplicationController

  def index
    # possibilité d'un if pour conditionner une selection de l'index
    # en fonction d'un paramettre de recherche
    @drones = Drone.all
  end

  def show
    set_drone
    @rental = Rental.new
    @rental.drone = Drone.find(params[:id])
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
    @drone = Drone.find(params[:id])
    @drone.destroy

    redirect_to dashboard_path
  end

  def search
    searched_start_date = params[:searched_start_date]
    searched_end_date = params[:searched_end_date]
    @available_drones = available_drones(searched_start_date, searched_end_date)
  end


  private
  def params_drone_create
    params.require(:drone).permit(:brand, :model, :daily_price, :weekly_deal,
                                  :monthly_deal, :autonomy, :range,
                                  :controller, :deposit, :battery,
                                  :photo_drone, photo_footage: [])
  end

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def params_drone_update
    params.require(:drone).permit(:brand, :model, :daily_price, :weekly_deal,
                                  :monthly_deal, :autonomy, :range,
                                  :controller, :deposit, :battery, :available,
                                  :photo_drone, photo_footage: [])
  end

  def available_drones(searched_start_date, searched_end_date)
    return if searched_start_date.nil? || searched_end_date.nil?
    rentals = Rental.where("start_date >= :s_start_date",
                      {s_start_date: params[:searched_start_date],
                       s_end_date: params[:searched_end_date]})
    drones = []
    rentals.each do |rental|
      drones << rental.drone
    end
    drones.uniq
  end
end


