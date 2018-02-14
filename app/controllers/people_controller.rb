class PeopleController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: PeopleDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @person = Person.new
  end


  def edit
  end

  def create
    @person = Person.new(person_params)

      if @person.save
        flash[:notice] = 'Person was successfully created.'
        redirect_to @person
      else
        flash[:error]= @person.errors.full_messages.to_sentence
        redirect_to new_person_path
        render  error: person.errors.full_messages
      end
  end


  def update
      if @person.update(person_params)
        flash[:notice] = 'Person was successfully updated.'
        redirect_to @person
      else
        flash[:error]= @person.errors.full_messages.to_sentence
        redirect_to edit_person_path
      end
  end

  def destroy
    @person.destroy
      flash[:notice] = 'Person was successfully destroyed.'
  end

  private
    def set_profile
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :date_of_birth, :phone_number)
    end

end
