class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :proofs do |t|
      t.timestamps
    end

    create_table :comunicados do |t|
      t.integer :creador_id
      t.integer :receptor_id
      t.string :asunto
      t.string :contenido
      t.integer :comunicado_anterior_id

      t.timestamps
    end

    create_table :personas do |t|
      t.string :nombre
      t.date :fecha_nacimiento

      t.timestamps
    end
    create_table :adjuntos do |t|

      t.timestamps
    end
  end
end
