class SurfboardsController < ApplicationController
  before_action :set_surfboard, only: %i[show edit update destroy]

  def index
    if params[:search].present?
      @surfboards = Surfboard.where("name ILIKE :search OR location ILIKE :search", search: "%#{params[:search]}%")
    else
      @surfboards = Surfboard.all
    end
    @markers = @surfboards.geocoded.map do |surfboard|
      {
        lat: surfboard.latitude,
        lng: surfboard.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { surfboard: surfboard }),
        image_url: helpers.asset_url('https://www.freepik.com/vectors/icons')
      }
    end
  end

  def show
    @marker =
  [{
    lat: @surfboard.latitude,
    lng: @surfboard.longitude,
    # infoWindow: render_to_string(partial: "info_window", locals: { surfboard: surfboard }),
    image_url: helpers.asset_url('https://www.freepik.com/vectors/icons')
  }]
  end

  def new
    @surfboard = Surfboard.new
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.owner = current_user
    if @surfboard.save!
      redirect_to surfboard_path(@surfboard)
    else
      render :new
    end
  end

  def edit; end

  def update
    @surfboard.update(surfboard_params)
    redirect_to surfboard_path(@surfboard)
  end

  def destroy
    @surfboard.destroy
    redirect_to surfboards_path
  end

  # def search
  #   search_keyword = params.fetch(:search)
  #   # TODO if search else alert
  #   # select * from surfboard.name LIKE '%SEARCH_KEYWORD%'
  #   result = Surfboard.where('name ILIKE ?', "%#{search_keyword}%")
  #   if result.present?
  #     @surfboard = result
  #   else
  #     redirect_to surfboards_not_found_path
  #   end
  # end

  def my_surfboards
    @surfboards = current_user.surfboards
  end

  private

  def surfboard_params
    surfboard_params = params.require(:surfboard).permit(:name, :details, :price, :photo, :location, :search)

  end

  def set_surfboard
    @surfboard = Surfboard.find(params[:id])
  end

end
