class ChangeDobColumnTypeOnPeople < ActiveRecord::Migration
  def change
    change_column :people, :date_of_birth, :string
  end
end
