# README 

* Ruby version: 3.0

* Rails version: 7

* Database: PostrgreSQL

* Tests: RSpec

* Linter: Rubocop

## Приложение для учета студентов, школ и классов. Приложение контейнеризовано, покрыто тестами RSpec. Встроен линтер Rubocop. Авторизация по токену. В приложении реализованы следующие эндпоинты:

### POST "/students" - создание студента. Параметры body: 
{
  "student": {
    "first_name": {Имя},
    "last_name": {Фамилия},
    "surname": {Отчество},
    "school_class_id": {class_id},
    "school_id": {school_id}
  }
}
### DELETE "/students/{student_id}:" - удаление студента.
### GET "/schools/{school_id}/classes/{class_id}/students" - список студентов класса.
### GET "/schools/{school_id}/classes" - список классов школы.

## Запуск:
### При первом взаимодействии с приложением:
```
docker-compose build
docker-compose up
```

### В контейнере создаем базу данных, прогоняем миграции и прогоняем сиды(если нужно):
```
rails db:create
rails db:migrate
rails db:seed
```

### В последующие разы приложение запускаем при помощи команды и просто работаем с ним:
```
docker-compose up
```

