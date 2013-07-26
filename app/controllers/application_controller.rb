class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def get_rest_options(options = {})
    defaults = { success: true, error_code: nil, error_msg: nil}
    options.reverse_merge(defaults)
  end

  def set_rest_options
    @rest_options = get_rest_options
  end

  def get_status
    @rest_options[:error_code].nil? ? 200 : @rest_options[:error_code]
  end
end
