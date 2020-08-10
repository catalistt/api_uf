class UfsController < ApplicationController
  #se agrega la gema 'responders' y se especifica que solo se responde a consultas json
  respond_to :json
  def daily
      #para contar la cantidad de veces que se consulta la uf
      setting = Setting.first
      setting.request_count += 1
      setting.save

      #para obtener el valor de la uf según la fecha
      @uf= UfPrice.find_by(date: params[:date])

      if @uf
      #con el punto uf se devuelve solo un dato y no todo el hash
        render json: @uf.uf, status: :ok
      else
      #Error en formato json
        render json: { error: "Fecha o parámetros no encontrados." }, status: 400
      end
  end
  def stats
      #para preguntar por la cantidad de consultas de un cliente
      @stats = Setting.first
      render json: @stats.request_count, status: :ok
  end
end