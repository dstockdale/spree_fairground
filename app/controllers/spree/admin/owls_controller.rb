class Spree::Admin::OwlsController < Spree::Admin::BaseController
  before_action :set_parent_resource
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @owls = @parliament.owls.all
  end

  def show
  end

  def new
    @owl = @parliament.owls.new
  end

  def edit
  end

  def create
    @owl = @parliament.owls.new(spree_owl_params)

    if @owl.save
      redirect_to admin_parliament_path(@parliament), notice: 'Slide was successfully created.'
    else
      render :new
    end
  end

  def update
    if @owl.update(spree_owl_params)
      redirect_to admin_parliament_owl_path(@parliament, @owl), notice: 'Slide was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @owl.destroy
    redirect_to admin_parliament_path(@parliament), notice: 'Slide was successfully destroyed.'
  end

  private

    def set_parent_resource
      @parliament = Spree::Parliament.find(params[:parliament_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @owl = @parliament.owls.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spree_owl_params
      params.require(:owl).permit(:attachment, :attachment_file_name, :alt)
    end
end
