class LoavesController < ApplicationController
  before_action :set_loaf, only: [:show, :edit, :update, :destroy]

  def index 
    @loaves = Loaf.all 
  end

  def show
    @loaf = Loaf.find(params[:id])
  end

  def new
    @loaf = Loaf.new
  end

  def create 
    @loaf = Loaf.new(loaf_params)

    if @loaf.save
      redirect_to @loaf
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @loaf = Loaf.find(params[:id])
  end

  def update
    @loaf = Loaf.find(params[:id])

    if @loaf.update(loaf_params)
      redirect_to loaves_path, notice: "Loaf was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @loaf = Loaf.find(params[:id])
    @loaf.destroy
    redirect_to loaves_path, notice: "Loaf was successfully deleted."
  end

  private

  def set_loaf
    @loaf = Loaf.find(params[:id])
  end

  def loaf_params
    params.require(:loaf).permit(:title, :body)
  end


end
