module Spree::Admin::ParliamentsHelper
  def render_slide slide
    layout = if slide.link
      "simple_link_layout"
    elsif slide.body
      "html_layout"
    else
      nil
    end
    render partial: "spree/admin/owls/slide", locals: { slide: slide }, layout: layout
  end
end
