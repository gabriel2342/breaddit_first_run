class LoafsController < ApplicationController
  before_action :set_loaf, only: [:show, :edit, :update, :destroy]

  def index 
    @loafs = Loaf.all 
  end

  def show
    @loaf = Loaf.find(params[:id])
  end

  def new
    @loaf = Loaf.new
  end

  def create 
    @loaf = Loaf.new(title: "...", body: "...")

    if @loaf.save
      redirect_to loafs_path, notice: "Loaf was successfully created."
    else
      render :new,  status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @loaf.update(title: "...", body: "..."))
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

  # def loaf_params
  #   params.require(:loaf).permit(:title)
  #   params.require(:loaf).permit(:body)
  # end


end
