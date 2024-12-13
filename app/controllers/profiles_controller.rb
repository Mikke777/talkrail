class ProfilesController < ApplicationController
  def index
    if params[:query].present?
      @profiles = Profile.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @profiles = []
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name)
  end
end
