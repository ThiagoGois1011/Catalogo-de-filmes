class GenerosController < ApplicationController
  def index
    @generos = Genero.all
  end

  def new
    @novo_genero = Genero.new
  end

  def create
    parametro_genero = params[:genero][:nome].capitalize
    unless Genero.find_by(nome: parametro_genero)
      @novo_genero = Genero.new(nome: parametro_genero)

      return redirect_to(generos_path) if @novo_genero.save
    end

    render :new
  end

  def edit
    @genero = Genero.find(params[:id])
  end

  def update
    @genero = Genero.find(params[:id])

    operacao = @genero.update(nome: params[:genero][:nome])
    return redirect_to(generos_path) if operacao
    render :edit
  end

  def show
    @genero = Genero.find(params[:id])
    @lista_de_filmes = Filme.where(genero_id: @genero.id)
  end
end
