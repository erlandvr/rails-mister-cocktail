class DosesController < ApplicationController
before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.dose
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path
    else
      render :new
    end
  end

  def Destroy
    @dose.destroy
  end

private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:description)
  end
end
