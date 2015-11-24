class CreditCalculatorController < ApplicationController

  def show

  end

  def calculate
    @result = Calculator.calculate(params[:amount], params[:months], params[:percent], params[:kind])
    @current_date = Date.current
    render :show
  end

end