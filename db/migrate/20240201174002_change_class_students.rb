class ChangeClassStudents < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :class_id, :school_class_id
  end
end
