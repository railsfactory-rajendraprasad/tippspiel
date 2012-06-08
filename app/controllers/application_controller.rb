class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!
  
  class AccessDenied < RuntimeError; end
  rescue_from AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end    
    
  def deny_access!(text='Zugriff verweigert')
    raise AccessDenied, text
  end  
end
