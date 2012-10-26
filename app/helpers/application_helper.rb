module ApplicationHelper

  def layout partial, locals = {}, &block
    render layout: layout_path(partial), locals: locals, &block
  end

  def layout_path partial
    "layouts/layouts/#{partial}"
  end

  def stylesheet(*args)
    content_for(:styles) { stylesheet_link_tag(*args.map(&:to_s)) }
  end

  def javascript(*args)
    content_for(:javascripts) { javascript_include_tag(*args) }
  end
end
