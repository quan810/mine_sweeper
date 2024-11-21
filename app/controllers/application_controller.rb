# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  include ErrorHandler
  allow_browser versions: :modern

  def require_authentication
    redirect_to root_path if session[:email].blank?
  end
end
