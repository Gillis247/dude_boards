class SurfboardsController < ApplicationController
  before_action :set_surfboard, only: [:show, :edit, :update, :destroy]
 
  def index
    @surfboards = Surfboard.all
  end

  def show
  end

  def new
    @surfboard = Surfboard.new
  end

  def edit    
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.user = current_user
    if @surfboard.save  
      redirect_to surfboard_path(@surfboard)
    else 
      render :new 
    end
  end

  def update
    @surfboard.update(params[:surfboard])
  end

  def destroy
    @surfboard.destroy
  end

  private
  
  def surfboard_params
    params.require(:surfboard).permit(:name, :details, :price, :location)
  end

  def set_surfboard
    @surfboard = Surfboard.find(params[:id])
  end
  
    
end
