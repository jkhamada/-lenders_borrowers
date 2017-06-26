class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:borrower_id]
      Borrower.find(session[:borrower_id])
    elsif session[:lender_id]
      Lender.find(session[:lender_id])
    end
  end

  helper_method :current_user
end
