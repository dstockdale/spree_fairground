class Spree::Admin::ParliamentsController < Spree::Admin::BaseController
  before_action :set_parliament, only: [:show, :edit, :update, :destroy]

  def index
    @parliaments = Spree::Parliament.all
  end

  def show
  end

  def new
    @parliament = Spree::Parliament.new
  end

  def edit
  end

  def create
    @parliament = Spree::Parliament.new(parliament_params)

    if @parliament.save
      redirect_to admin_parliament_url(@parliament), notice: 'Parliament was successfully created.'
    else
      render :new
    end
  end

  def update
    if @parliament.update(parliament_params)
      redirect_to admin_parliament_url(@parliament), notice: 'Parliament was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @parliament.destroy
    redirect_to admin_parliaments_url, notice: 'Parliament was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parliament
      @parliament = Spree::Parliament.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parliament_params
      params.require(:parliament).permit(:name)
    end
end
