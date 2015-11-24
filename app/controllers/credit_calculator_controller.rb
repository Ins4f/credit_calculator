class CreditCalculatorController < ApplicationController

  def show

  end

  def calculate
    @result = Calculator.calculate(params[:amount], params[:months], params[:percent], params[:kind])
    render :show
  end

end