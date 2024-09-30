class GenerosController < ApplicationController
  def index
    @generos = Genero.all
  end

  def new
    @novo_genero = Genero.new
  end

  def create
    parametro_genero = params[:genero][:nome].capitalize
    if !Genero.find_by(nome: parametro_genero)
      @novo_genero = Genero.new(nome: parametro_genero)

      if @novo_genero.save
        return redirect_to generos_path
      end

    end

    render :new
  end

  def edit
    @genero = Genero.find(params[:id])
  end

  def update
    @genero = Genero.find(params[:id])

    operacao = @genero.update(nome: params[:genero][:nome])
    if operacao
      return redirect_to(generos_path)
    end
    render :edit
  end
end
