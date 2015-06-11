Spree::BaseHelper.module_eval do
  def carousel(view)
    # use view to look up if there's a carousel available
    collection = Spree::Parliament.first.owls
    render partial: "spree/parliaments/owls", locals: { collection: collection }
  end
end