class Student < ApplicationRecord
  belongs_to :school_class, class_name: 'School::Class'
  belongs_to :school
end
