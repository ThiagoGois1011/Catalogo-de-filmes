class Genero < ApplicationRecord
  has_many :diretors, foreign_key: "genero_favorito_id"
end
