5.times do
  School.create
end

10.times do
  School::Class.create(school_id: School.find(School.ids.sample).id,
                       number: rand(1..11),
                       letter: %w[А Б В Г].sample)
end

100.times do
  class_id = School::Class.pluck(:id).sample
  school_id = School::Class.find(class_id).school.id

  Student.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 surname: Faker::Name.middle_name,
                 school_class_id: class_id,
                 school_id: school_id)

  School::Class.all.each do |school_class|
    students_count = school_class.students.count
    school_class.update(students_count: students_count)
  end
end
