# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_19_173322) do

  create_table "adjuntos", force: :cascade do |t|
    t.integer "comunicado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comunicado_id"], name: "index_adjuntos_on_comunicado_id"
  end

  create_table "comunicados", force: :cascade do |t|
    t.integer "creador_id"
    t.integer "receptor_id"
    t.string "asunto"
    t.string "contenido"
    t.integer "comunicado_anterior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comunicado_anterior_id"], name: "index_comunicados_on_comunicado_anterior_id"
    t.index ["creador_id"], name: "index_comunicados_on_creador_id"
    t.index ["receptor_id"], name: "index_comunicados_on_receptor_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha_nacimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proofs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
