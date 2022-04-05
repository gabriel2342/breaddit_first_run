class LoafsController < ApplicationController
  before_action :set_loaf, only: [:show, :edit, :update, :destroy]

  def index 
    @loafs = Loaf.all 
  end

  def show; end

  def new
    @loaf = Loaf.new
  end

  def create 
    @loaf = Loaf.new(loaf_params)

    if @loaf.save
      redirect_to loafs_path, notice: "Loaf was successfully created."
    else
      render :new 
    end
  end

  def edit; end

  def update
    if @loaf.update(loaf_params)
      redirect_to loafs_path, notice: "Loaf was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @loaf.destroy
    redirect_to loafs_path, notice: "Loaf was successfully deleted."
  end

  private

  def set_loaf
    @loaf = Loaf.find(params[:id])
  end

  def loaf_params
    params.require(:loaf).permit(:title).permit(:body)
  end


end
