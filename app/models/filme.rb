class Filme < ApplicationRecord
  belongs_to :diretor
  belongs_to :genero
end
