class AddScoolIdToClasses < ActiveRecord::Migration[7.1]
  def change
    add_column :classes, :school_id, :integer
  end
end
