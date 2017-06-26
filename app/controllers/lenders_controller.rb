class LendersController < ApplicationController
  def new
  end

  def create
    @lender = Lender.new(lender_params)
    if @lender.save
      session[:lender_id] = @lender.id
      redirect_to "/lenders/#{@lender.id}"
    else
      flash[:errors] = @lender.errors.full_messages
      redirect_to :back
    end
   end

  def show
      @lender = Lender.find(params[:id])
      @borrowers = Borrower.all
      @lenders = @lender.histories
      @total = @lender.money - @lenders.sum(:amount)
  end

  def lend
      history = History.new(lender_id: params[:lender_id], borrower_id: params[:borrower_id], amount: params[:amount])
      history.save
      redirect_to "/lenders/#{history.lender_id}"
      #what does history.lender mean?
  end



  private
    def lender_params
      params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
    end

# can we as also make a history_params?
end
