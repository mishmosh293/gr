class SquirrelsController < ApplicationController
  before_action :set_squirrel, only: %i[show edit update destroy]

  def index
    @q = Squirrel.ransack(params[:q])
    @squirrels = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show; end

  def new
    @squirrel = Squirrel.new
  end

  def edit; end

  def create
    @squirrel = Squirrel.new(squirrel_params)

    if @squirrel.save
      redirect_to @squirrel, notice: "Squirrel was successfully created."
    else
      render :new
    end
  end

  def update
    if @squirrel.update(squirrel_params)
      redirect_to @squirrel, notice: "Squirrel was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @squirrel.destroy
    redirect_to squirrels_url, notice: "Squirrel was successfully destroyed."
  end

  private

  def set_squirrel
    @squirrel = Squirrel.find(params[:id])
  end

  def squirrel_params
    params.require(:squirrel).permit(:name, :description, :age)
  end
end
