class CreateFilmes < ActiveRecord::Migration[7.2]
  def change
    create_table :filmes do |t|
      t.string :titulo
      t.integer :ano
      t.string :sinopse
      t.string :origem
      t.integer :duracao
      t.references :diretor, null: false, foreign_key: true
      t.references :genero, null: false, foreign_key: true

      t.timestamps
    end
  end
end
