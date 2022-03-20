class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :proofs do |t|
      t.timestamps
    end

    create_table :comunicados do |t|
      t.integer :creador_id, index: true
      t.integer :receptor_id, index:true
      t.string :asunto
      t.string :contenido
      t.integer :comunicado_anterior_id, index: true

      t.timestamps
    end

    create_table :personas do |t|
      t.string :nombre
      t.date :fecha_nacimiento

      t.timestamps
    end
    create_table :adjuntos do |t|
      t.integer :comunicado_id, index: true
      t.timestamps
    end
  end
end
