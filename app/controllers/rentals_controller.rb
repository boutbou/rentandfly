class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
  end

  def destroy
  end

  def create
    @rental = Rental.new(params_rental)
    @rental.drone = Drone.find(params[:drone_id])
    @rental.user = current_user
    if @rental.save
      redirect_to dashboard_path, notice: "OK, drone booked for a total price of #{@rental.total_price} €"
    else
      render "rentals/new"
    end
  end

  def new
    @rental = Rental.new(params_rental)
    @drone = Drone.find(params[:drone_id])
  end


  def params_rental
    params.require(:rental).permit(:end_date, :start_date)
  end
private
end
