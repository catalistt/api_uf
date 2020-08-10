Rails.application.routes.draw do
  #el :date sirven como un alias y representa la fecha
  get '/ufs/:date', to: 'ufs#daily' 
  get '/client/:client', to: 'ufs#stats'
end
