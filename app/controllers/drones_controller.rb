class DronesController < ApplicationController
  def create
  end

  def index
    # possibilité d'un if pour conditionner une selection de l'index
    # en fonction d'un paramettre de recherche
    @drones = Drone.all
  end

  def show
    @drone = Drone.find(params[:id])
    @rental = Rental.new
    @rental.drone = Drone.find(params[:id])
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end
end
