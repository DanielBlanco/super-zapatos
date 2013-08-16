class Services::BaseController < ApplicationController
  respond_to :json
  prepend_view_path 'app/views/services'
  before_filter :authenticate
  
  rescue_from Exception, :with => :render_500
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  rescue_from ActionController::RoutingError, :with => :not_found
  
  protected
  
    # Render an error message.
    def render_500(exception)
      render :json => { error_msg: exception.message, error_code: 500, success: false }, :status => :internal_server_error
    end
  
    # If a record is not found, render the exception message.
    def not_found(exception)
      render :json => { error_msg: 'Record not Found', error_code: 404, success: false }, :status => :not_found
    end
    
    # HTTP Basic auth.
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "my_user" && password == "my_password"
      end
    end
end