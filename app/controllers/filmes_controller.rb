class FilmesController < ApplicationController
  def index
        @filmes = Filme.all
  end

  def new
    @novo_filme = Filme.new
    @select_opcoes_diretores = Diretor.all.map { |diretor| [ diretor.nome, diretor.id ] }
    @select_opcoes_generos = Genero.all.map { |genero| [ genero.nome, genero.id ] }
  end

  def create
    params_filme = params[:filme]
    return if params_filme[:diretor_id].empty? || params_filme[:genero_id].empty?

    @novo_filme = Filme.new(
      titulo: params_filme[:titulo],
      ano: params_filme[:ano],
      sinopse: params_filme[:sinopse],
      origem: params_filme[:origem],
      duracao: params_filme[:duracao],
      diretor_id: params_filme[:diretor_id],
      genero_id: params_filme[:genero_id]
    )

    redirect_to(filmes_path) if @novo_filme.save
  end

  def edit
    @filme = Filme.find(params[:id])
    @select_opcoes_diretores = Diretor.all.map { |diretor| [ diretor.nome, diretor.id ] }
    @select_opcoes_generos = Genero.all.map { |genero| [ genero.nome, genero.id ] }
  end

  def update
    params_filme = params[:filme]
    @select_opcoes_diretores = Diretor.all.map { |diretor| [ diretor.nome, diretor.id ] }
    @select_opcoes_generos = Genero.all.map { |genero| [ genero.nome, genero.id ] }
    return if params_filme[:diretor_id].empty? || params_filme[:genero_id].empty?

    @filme = Filme.find(params[:id])

    operacao = @filme.update(
      titulo: params_filme[:titulo],
      ano: params_filme[:ano],
      sinopse: params_filme[:sinopse],
      origem: params_filme[:origem],
      duracao: params_filme[:duracao],
      diretor_id: params_filme[:diretor_id],
      genero_id: params_filme[:genero_id]
    )
    redirect_to(filmes_path) if operacao
  end

  def show
    @filme = Filme.find(params[:id])
  end
end
