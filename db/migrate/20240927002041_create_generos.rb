class CreateGeneros < ActiveRecord::Migration[7.2]
  def change
    create_table :generos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
