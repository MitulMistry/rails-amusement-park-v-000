class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)

    if attraction.save
      flash[:notice] = "Attraction created"
      redirect_to attraction_path(attraction)
    else
      flash[:error] = "Error: Attraction creation failed"
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def destroy

  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :min_height, :tickets)
  end
end