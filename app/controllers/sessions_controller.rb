class SessionsController < ApplicationController
  def new
  end

#login method
def create
  @borrower = Borrower.find_by_email(params[:email])
  @lender = Lender.find_by_email(params[:email])
  if @borrower && @borrower.authenticate(params[:password])
     session[:borrower_id] = @borrower.id
     redirect_to "/borrowers/#{@borrower.id}"
     #"/borrowers/2"
  elsif @lender && @lender.authenticate(params[:password])
      session[:lender_id] = @lender.id
      redirect_to "/lenders/#{@lender.id}"

  else
    flash[:errors] = ['User not found. Please check you email, or register']
    redirect_to :back
    end
  end


#logout method
    def destroy
      reset_session
      redirect_to '/sessions/new'
    end





end
