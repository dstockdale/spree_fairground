class Spree::Admin::CarouselsController < Spree::Admin::BaseController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @carousels = Spree::Fairground::Carousel.all
  end

  def show
    @slides = @carousel.slides
  end

  def new
    @carousel = Spree::Fairground::Carousel.new
  end

  def edit
  end

  def create
    @carousel = Spree::Fairground::Carousel.new(carousel_params)

    if @carousel.save
      redirect_to admin_carousel_url(@carousel), notice: 'Carousel was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carousel.update(carousel_params)
      redirect_to admin_carousel_url(@carousel), notice: 'Carousel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carousel.destroy
    redirect_to admin_carousels_url, notice: 'Carousel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @carousel = Spree::Fairground::Carousel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def carousel_params
      params.require(:carousel).permit(:name, slides_attributes: [:attachment, :feature_id, :feature_value, :alt])
    end
end
