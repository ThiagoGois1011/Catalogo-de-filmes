class AddDefaultToStatus < ActiveRecord::Migration[7.2]
  def change
     change_column_default :filmes, :status, 0
  end
end
