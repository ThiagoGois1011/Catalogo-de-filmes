class Filme < ApplicationRecord
  enum status: { a_ser_lancado: 0, ja_lancamento: 1 }
  belongs_to :diretor
  belongs_to :genero
end
