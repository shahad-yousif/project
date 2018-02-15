class PeopleDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :link_to, :check_box_tag, :number_to_currency, to: :@view
  def initialize(view)
    @view = view
  end
  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Person.count,
      iTotalDisplayRecords: people.total_entries,
      aaData: data
    }
  end
private
  def data
    people.map do |pl|
      [
        link_to(pl.name, pl),
        pl.date_of_birth,
        pl.phone_number,
      ]
    end
  end
  def people
    @people ||= fetch_people
  end
  def search_columns
    %w(name date_of_birth phone_number)
  end
  def fetch_people
    search_string = []
    search_columns.each do |s|
      search_string << "#{s} like :search"
    end
    people = Person.order("#{sort_column} #{sort_direction}")
    people = people.page(page).per_page(per_page)
    if params[:sSearch].present?
      people = people.where(search_string.join(' or '), search: "%#{params[:sSearch]}%")
    end
    people
  end
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end
  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end
  def sort_column
    columns = %w[name date_of_birth phone_number]
    columns[params[:iSortCol_0].to_i]
  end
  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end