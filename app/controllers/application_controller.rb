class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_rest_options(options = {})
    defaults = { success: true, error_code: nil, error_msg: nil}
    options.reverse_merge(defaults)
  end
end
