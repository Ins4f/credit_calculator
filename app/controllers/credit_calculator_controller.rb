class CreditCalculatorController < ApplicationController

  def show

  end

  def calculate
    @amount = params[:amount]
    @months = params[:months]
    @kind = params[:kind]
    @percent = params[:percent]
    @round = '%.2f'

    @result = Calculator.calculate(params[:amount], params[:months], params[:percent], params[:kind])
    @current_date = Date.current
    render :show
  end

end