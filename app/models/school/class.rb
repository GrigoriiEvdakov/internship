class School::Class < ApplicationRecord
  self.table_name = 'classes'

  belongs_to :school
  has_many :students, foreign_key: :school_class_id
end
