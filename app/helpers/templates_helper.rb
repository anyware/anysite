module TemplatesHelper
  def render_template(name)
    render :partial => "/site/templates/default/#{name}"
  end
end
