class DiretorController < ApplicationController
  def index
    @diretores = Diretor.all
  end

  def new
    @novo_diretor = Diretor.new
    @select_opcoes = Genero.all.map { |genero| [ genero.nome, genero.id ] }
  end

  def create
    params_diretor = params[:diretor]
    @novo_diretor = Diretor.new(
      nome: params_diretor[:nome],
      nacionalidade: params_diretor[:nacionalidade],
      data_de_aniversario: params_diretor[:data_de_aniversario],
      genero_favorito_id: params_diretor[:genero_favorito_id]
    )

    redirect_to(diretor_index_path) if @novo_diretor.save
  end

  def edit
    @diretor = Diretor.find(params[:id])
    @select_opcoes = Genero.all.map { |genero| [ genero.nome, genero.id ] }
  end

  def update
    params_diretor = params[:diretor]
    @select_opcoes = Genero.all.map { |genero| [ genero.nome, genero.id ] }
    return if params_diretor[:genero_favorito_id].empty?

    @diretor = Diretor.find(params[:id])

    operacao = @diretor.update(
      nome: params_diretor[:nome],
      nacionalidade: params_diretor[:nacionalidade],
      data_de_aniversario: params_diretor[:data_de_aniversario],
      genero_favorito_id: params_diretor[:genero_favorito_id]
    )
    redirect_to(diretor_index_path) if operacao
  end

  def show
    @diretor = Diretor.find(params[:id])
    @lista_de_filmes = Filme.where(diretor_id: @diretor.id)
  end
end
