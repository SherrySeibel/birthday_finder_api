class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :date_of_birth, null: false

      t.timestamps null: false
    end
  end
end
