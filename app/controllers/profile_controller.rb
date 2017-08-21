class ProfileController < ApplicationController

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update, keys: [:address, :zip_code,
                                                            :city, :description,
                                                            :photo])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name, :address, :zip_code, :city,
                                 :description, :photo)
  end
end


