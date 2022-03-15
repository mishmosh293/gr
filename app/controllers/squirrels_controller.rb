class SquirrelsController < ApplicationController
  before_action :set_squirrel, only: [:show, :edit, :update, :destroy]

  # GET /squirrels
  def index
    @squirrels = Squirrel.page(params[:page]).per(10)
  end

  # GET /squirrels/1
  def show
  end

  # GET /squirrels/new
  def new
    @squirrel = Squirrel.new
  end

  # GET /squirrels/1/edit
  def edit
  end

  # POST /squirrels
  def create
    @squirrel = Squirrel.new(squirrel_params)

    if @squirrel.save
      redirect_to @squirrel, notice: 'Squirrel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /squirrels/1
  def update
    if @squirrel.update(squirrel_params)
      redirect_to @squirrel, notice: 'Squirrel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /squirrels/1
  def destroy
    @squirrel.destroy
    redirect_to squirrels_url, notice: 'Squirrel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squirrel
      @squirrel = Squirrel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def squirrel_params
      params.require(:squirrel).permit(:name, :description, :age)
    end
end
