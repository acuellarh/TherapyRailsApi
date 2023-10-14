class PacientsController < ApplicationController
  def index
    render json: Pacient.all
  end
end
