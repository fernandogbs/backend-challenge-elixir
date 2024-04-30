defmodule EcommerceWeb.ErrorHTML do
  use EcommerceWeb, :html

  embed_templates "error_html/*"

  def render_404(template, assigns) do
    status = assigns.status || 404
    message = Phoenix.Controller.status_message_from_template(template)
    fallback(%{status: status, message: message})
  end
end
