class OutfitsController < ApplicationController
  respond_to :html

  before_filter :authenticate_user!, only: [:new, :edit]
  before_filter :find_outfit, only: [:show, :edit, :update, :destroy]

  def index
    @outfits = Outfit.recent.includes(:user).page(params[:page])
  end

  def show
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(params[:outfit]) do |outfit|
      outfit.user = current_user
    end
    @outfit.save
    respond_with @outfit
  end

  private

  def find_outfit
    @outfit = Outfit.find(params[:id])
  end

end
