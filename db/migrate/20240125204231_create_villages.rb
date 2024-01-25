class CreateVillages < ActiveRecord::Migration[7.1]
  def change
    create_table :villages do |t|
      t.string :village_name
      t.references :ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
