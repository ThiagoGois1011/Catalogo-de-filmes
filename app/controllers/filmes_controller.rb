class FilmesController < ApplicationController
  def index
        @filmes = Filme.all
  end
end
