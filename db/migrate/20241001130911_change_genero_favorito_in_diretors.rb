class ChangeGeneroFavoritoInDiretors < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :diretors, :genero_favoritos
    add_foreign_key :diretors, :generos, column: :genero_favorito_id, null: false
    change_column_default :diretors, :genero_favorito_id, 0
  end
end
