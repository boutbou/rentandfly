class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
    @drone = Drone.find(@rental.drone_id)
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy

    redirect_to dashboard_path
  end

  def create
    @rental = Rental.new(params_rental_create)
    @rental.drone = Drone.find(params[:drone_id])
    @rental.user = current_user
    if @rental.drone.available?
      if @rental.save
        redirect_to dashboard_path, notice: "OK, drone booked for a total price of #{@rental.total_price} €"
      else
        render "rentals/new", notice: "Wrong booking not made"
      end
    else
      render "rentals/new", notice: "This drone is not available"
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
  def params_rental_create
    params.require(:rental).permit(:end_date, :start_date)
  end

end
