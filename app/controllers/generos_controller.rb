class GenerosController < ApplicationController
  def index
    @generos = Genero.all
  end

  def new
  end
end
