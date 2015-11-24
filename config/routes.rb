Rails.application.routes.draw do
  root 'credit_calculator#show'
  get 'calculate', controller: :credit_calculator
end
