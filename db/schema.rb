# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_02_131611) do
  create_table "diretors", force: :cascade do |t|
    t.string "nome"
    t.string "nacionalidade"
    t.date "data_de_aniversario"
    t.integer "genero_favorito_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genero_favorito_id"], name: "index_diretors_on_genero_favorito_id"
  end

  create_table "filmes", force: :cascade do |t|
    t.string "titulo"
    t.integer "ano"
    t.string "sinopse"
    t.string "origem"
    t.integer "duracao"
    t.integer "diretor_id", null: false
    t.integer "genero_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diretor_id"], name: "index_filmes_on_diretor_id"
    t.index ["genero_id"], name: "index_filmes_on_genero_id"
  end

  create_table "generos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "diretors", "generos", column: "genero_favorito_id"
  add_foreign_key "filmes", "diretors"
  add_foreign_key "filmes", "generos"
end
