class PeopleController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: PeopleDatatable.new(view_context) }
    end
  end

  def show
    @person = Person.find(params[:id])
  end


end
