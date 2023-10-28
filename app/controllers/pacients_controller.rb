class PacientsController < ApplicationController
  def index
    pacients = Pacient.all

    render json: PacientsRepresenter.new(pacients).as_json
  end
end
