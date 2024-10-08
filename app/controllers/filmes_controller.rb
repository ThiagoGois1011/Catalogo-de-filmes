class FilmesController < ApplicationController
  def index
        @filmes = Filme.ja_lancamento
        @filmes_em_rascunho = Filme.a_ser_lancado
  end

  def new
    @novo_filme = Filme.new
    @select_opcoes_status = [ [ "Rascunho", 0 ], [ "Lançado", 1 ] ]
    @previous_url = request.referer
  end

  def create
    params_filme = params[:filme]
    return if params_filme[:diretor_id].empty? || params_filme[:genero_id].empty?

    @novo_filme = Filme.new(
      poster_url: params_filme[:poster_url],
      titulo: params_filme[:titulo],
      ano: params_filme[:ano],
      sinopse: params_filme[:sinopse],
      origem: params_filme[:origem],
      duracao: params_filme[:duracao],
      diretor_id: params_filme[:diretor_id],
      genero_id: params_filme[:genero_id],
      status: Integer(params_filme[:status])
    )

    redirect_to(params_filme[:previous_url] || filmes_path) if @novo_filme.save
  end

  def edit
    @filme = Filme.find(params[:id])
    @select_opcoes_status = [ [ "Rascunho", 0 ], [ "Lançado", 1 ] ]
    @previous_url = request.referer
  end

  def update
    params_filme = params[:filme]
    return if params_filme[:diretor_id].empty? || params_filme[:genero_id].empty?

    @filme = Filme.find(params[:id])

    operacao = @filme.update(
      poster_url: params_filme[:poster_url],
      titulo: params_filme[:titulo],
      ano: params_filme[:ano],
      sinopse: params_filme[:sinopse],
      origem: params_filme[:origem],
      duracao: params_filme[:duracao],
      diretor_id: params_filme[:diretor_id],
      genero_id: params_filme[:genero_id],
      status: Integer(params_filme[:status])
    )
    redirect_to(params_filme[:previous_url] || filmes_path) if operacao
  end

  def show
    @filme = Filme.find(params[:id])
  end
end
