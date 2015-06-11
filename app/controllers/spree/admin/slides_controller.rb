class Spree::Admin::SlidesController < Spree::Admin::BaseController
  before_action :set_parent_resource
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @slides= @carousel.slides.all
  end

  def show
  end

  def new
    @slide = @carousel.slides.new
  end

  def edit
  end

  def create
    @slide = @carousel.slides.new(spree_slide_params)

    if @slide.save
      redirect_to admin_carousel_path(@carousel), notice: 'Slide was successfully created.'
    else
      render :new
    end
  end

  def update
    if @slide.update(spree_slide_params)
      redirect_to admin_carousel_slide_path(@carousel, @slide), notice: 'Slide was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @slide.destroy
    redirect_to admin_carousel_path(@carousel), notice: 'Slide was successfully destroyed.'
  end

  def sort
    updates = params[:sorting].each_with_index do |id, index|
      position = index + 1
      @carousel.slides.find(id).update_column(:position, position)
    end
    respond_to do |format|
      format.json { render json: { success: true }, status: :ok }
    end
  end

  private

    def set_parent_resource
      @carousel = Spree::Carousel.find(params[:carousel_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @slide = @carousel.slides.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spree_slide_params
      params.require(:slide).permit(:attachment, :attachment_file_name, :alt, :link, :body, :slide_type, :sorting)
    end
end
