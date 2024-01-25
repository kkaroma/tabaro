class CreateWards < ActiveRecord::Migration[7.1]
  def change
    create_table :wards do |t|
      t.string :ward_name
      t.references :division, null: false, foreign_key: true

      t.timestamps
    end
  end
end
