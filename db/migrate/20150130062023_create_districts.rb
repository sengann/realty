class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :dis_name
      t.text :note
      
      #thisline adds and integer column called 'province_id'
      t.references :province, index: true

      t.timestamps null: false
    end
    add_foreign_key :districts, :provinces
  end
end
