module ApplicationHelper
  def render_errors_for(obj)
    return unless obj.errors.any?
    render 'layouts/errors', obj: obj
  end
end
