class AddIndexesToTables < ActiveRecord::Migration[7.1]
  def change
    add_index :classes, :school_id
    add_index :students, %i[school_id school_class_id first_name last_name]
  end
end
