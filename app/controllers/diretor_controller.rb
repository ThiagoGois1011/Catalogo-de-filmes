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
      genero_favorito_id: params_diretor[:genero_favorito_id])

    puts "@novo_diretor"
    puts @novo_diretor[:nome]
    puts @novo_diretor[:nacionalidade]
    puts @novo_diretor[:data_de_aniversario]
    puts @novo_diretor[:genero_favorito_id]
    puts @novo_diretor.save
    puts @novo_diretor.errors.full_messages
    puts Genero.find_by(id: @novo_diretor[:genero_favorito_id])[:nome]
    redirect_to(diretor_index_path) if @novo_diretor.save
  end

  def edit
  end

  def update
  end
end
