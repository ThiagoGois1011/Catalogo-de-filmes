class CreateDiretors < ActiveRecord::Migration[7.2]
  def change
    create_table :diretors do |t|
      t.string :nome
      t.string :nacionalidade
      t.date :data_de_aniversario
      t.references :genero_favorito, null: false, foreign_key: true

      t.timestamps
    end
  end
end
