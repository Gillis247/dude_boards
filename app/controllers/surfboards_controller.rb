class SurfboardsController < ApplicationController
  before_action :set_surfboard, only: %i[show edit update destroy]

  def index
    @surfboards = Surfboard.all
    @markers = @surfboards.geocoded.map do |surfboard|
      {
        lat: surfboard.latitude,
        lng: surfboard.longitude,
        info_Window: render_to_string(partial: "info_window", locals: { surfboard: surfboard })
      }
    end
  end

  def show; end

  def new
    @surfboard = Surfboard.new
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.user = current_user
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

  def search
    search = params.fetch(:search).downcase
    # TODO if search else alert
    result = Surfboard.where('name LIKE ?', "%#{search}%")
    if result.present?
      @surfboard = result.take
    else
      redirect_to surfboards_not_found_path
    end
  end

  private

  def surfboard_params
    surfboard_params = params.require(:surfboard).permit(:name, :details, :price, :photo, :location, :search)
    surfboard_params.fetch(:name, '').downcase!
    surfboard_params
  end

  def set_surfboard
    @surfboard = Surfboard.find(params[:id])
  end

end
