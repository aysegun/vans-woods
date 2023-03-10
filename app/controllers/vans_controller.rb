class VansController < ApplicationController
  before_action :set_van, only: %i[show destroy edit]

  def index
    @vans = Van.all
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {van: van}),
        marker_html: render_to_string(partial: "marker")
      }
    end

    if params[:query].present?
      sql_query = "title ILIKE :query OR model ILIKE :query OR description ILIKE :query"
      @vans = Van.where(sql_query, query: "%#{params[:query]}%")
      @markers = @vans.geocoded.map do |van|
        {
          lat: van.latitude,
          lng: van.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: {van: van}),
          marker_html: render_to_string(partial: "marker")
        }
      end
    else
      @vans = Van.all
    end
  end

  def new
    @van = Van.new
  end

  def show
    @van = Van.find(params[:id])
    @markers = [{
      lat: @van.latitude,
      lng: @van.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {van: @van}),
      marker_html: render_to_string(partial: "marker")
    }]
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    if @van.save
      redirect_to vans_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end
  def update
    @van = Van.find(params[:id])
    @van.update(status: params[:status])

    redirect_to vans_path
  end

  def destroy
    @van.destroy

    redirect_to van_path(@van.user), status: :see_other
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def van_params
    params.require(:van).permit(:title, :capacity, :price, :description, :model, :year, :user_id, photos: [])
  end
end
