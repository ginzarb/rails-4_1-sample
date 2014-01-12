class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :detect_device_variant

  private
    def detect_device_variant
#      request.variant = :local if request.remote_addr == '127.0.0.1' # local ip
      request.variant = :android if request.user_agent =~ /android/i
      request.variant = :iphone if request.user_agent =~ /iPhone/i
    end
end
