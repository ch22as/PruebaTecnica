class CreateProofs < ActiveRecord::Migration[5.2]
  def change
    create_table :proofs do |t|
      t.timestamps
    end
  end
end
