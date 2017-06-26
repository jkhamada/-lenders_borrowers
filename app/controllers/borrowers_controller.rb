class BorrowersController < ApplicationController

  def new
  end

  def create
  @borrower = Borrower.new(borrower_params)
  if @borrower.save
  session[:borrower_id] = @borrower.id
  redirect_to "/borrowers/#{@borrower.id}"
  else
    flash[:errors] = @borrower.errors.full_messages
    redirect_to :back
  end
end

  def show
      @borrower = Borrower.find(params[:id])
      @borrowers = @borrower.histories
  end







  def destroy
  @borrower = Borrower.find(params[:id]).destroy
  if @borrower.id == session[:borrower_id]
      @borrower.destroy
      @borrower.destroy
      reset_session
      redirect_to :root
  else
      flash[:errors] = ['You are not allowed to delete this user!']
      redirect_to :back
  end
end


  private
    def borrower_params
      params.require(:borrower).permit(:first_name, :last_name, :email, :password, :money, :purpose, :description, :raised)
    end







end
