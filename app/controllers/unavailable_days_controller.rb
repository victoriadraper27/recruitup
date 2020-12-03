class UnavailableDaysController < ApplicationController
  after_action :authorize_unavailable_day

  def create
    @unavailable_day = UnavailableDay.new(unavailable_day_params)
    @unavailable_day.user = current_user
    if @unavailable_day.save
      redirect_to '/dashboard'
    else
      render '/dashboard'
    end
  end

  def destroy
    @unavailable_day = UnavailableDay.find(params[:id])
    @user = @unavailable_day.user
    @unavailable_day.destroy
    redirect_to dashboard_path
  end

  private

  def unavailable_day_params
    params.require(:unavailable_day).permit(:date)
  end

  def authorize_unavailable_day
    authorize @unavailable_day
  end
end
