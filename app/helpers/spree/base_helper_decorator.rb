Spree::BaseHelper.module_eval do
  def carousel(view)
    # use view to look up if there's a carousel available
    collection = Spree::Carousel.first.slides
    render partial: "spree/carousels/slides", locals: { collection: collection }
  end
end