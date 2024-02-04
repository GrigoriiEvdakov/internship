class School < ApplicationRecord
  has_many :classes, class_name: 'School::Class'
end
