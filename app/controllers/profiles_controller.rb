class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]


  def index
    @profiles = Profile.all
  end

  def change_status
    profile = Profile.find( params[:id])
    profile.active = !profile.active
    if profile.save
      flash[:notice] = "#{profile.first_name} has been #{profile.active ? 'activated' : 'deactivated'}"
    else
      flash[:error]= profile.errors.full_messages.to_sentence
    end
    respond_to do |format|
      format.js {head :ok}
    end
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)

      if @profile.save
        flash[:notice] = 'Profile was successfully created.'
        redirect_to @profile
      else
        flash[:error]= @profile.errors.full_messages.to_sentence
        redirect_to new_profile_path
      end
  end

  def update
      if @profile.update(profile_params)
        flash[:notice] = 'Profile was successfully updated.'
        redirect_to @profile
      else
        flash[:error]= @profile.errors.full_messages.to_sentence
        redirect_to edit_profile_path
      end
  end

  def destroy
    @profile.destroy
      flash[:notice] = 'Profile was successfully destroyed.'
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :gender, :email, :person_id, :active)
    end
end
