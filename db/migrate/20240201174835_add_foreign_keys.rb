class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :students, :schools, column: :school_id
    add_foreign_key :students, :classes, column: :school_class_id
    add_foreign_key :classes, :schools, column: :school_id
  end
end
