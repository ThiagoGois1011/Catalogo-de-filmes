class Diretor < ApplicationRecord
  belongs_to :genero, foreign_key: "genero_favorito_id"
end
