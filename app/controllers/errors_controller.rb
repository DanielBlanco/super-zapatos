# -*- encoding : utf-8 -*-
class ErrorsController < ApplicationController
  ERRORS = [
    :internal_server_error,
    :not_found
  ].freeze

  ERRORS.each do |e|
    define_method e do
      message = e == :not_found ? "The requested resource was not found" : "We're sorry, but something went wrong."
      if env["REQUEST_PATH"] =~ /^\/services/
        render :json => {error_msg: message, error_code: e, success: false}, :status => e
      else
        render :text => message, :status => e
      end
    end
  end
end
