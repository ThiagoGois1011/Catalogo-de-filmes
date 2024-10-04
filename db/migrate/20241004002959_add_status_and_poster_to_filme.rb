class AddStatusAndPosterToFilme < ActiveRecord::Migration[7.2]
  def change
    add_column :filmes, :status, :integer
    add_column :filmes, :poster, :string
  end
end
