class RenamePosterFromFilme < ActiveRecord::Migration[7.2]
  def change
    rename_column :filmes, :poster, :poster_url
  end
end
