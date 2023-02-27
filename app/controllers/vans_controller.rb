class VansController < ApplicationController
  before_action :set_van, only: %i[show]

  def index
    @vans = Van.all
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    if @van.save
      redirect_to vans_path(@van)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def van_params
    params.require(:user).permit(:title, :capacity, :price, :description, :model, :year)
  end
end
