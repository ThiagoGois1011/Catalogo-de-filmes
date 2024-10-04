class Filme < ApplicationRecord
  enum status: { a_ser_lancado: 0, ja_lancamento: 1 }
  belongs_to :diretor
  belongs_to :genero

  def self.texto_para_status(string_enum)
    case string_enum
    when "a_ser_lancado"
      "A ser lançado"
    when "ja_lancamento"
      "Já lançado"
    end
  end
end
