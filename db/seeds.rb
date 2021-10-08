# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# projects:
#  - title: 'Семья'
#    todos:
#     - text: 'Купить молоко'
#       isCompleted: false
#     - text: 'Заменить масло в двигателе до 23 апреля'
#       isCompleted: false
#     - text: 'Отправить письмо бабушке'
#       isCompleted: true
#     - text: 'Заплатить за квартиру'
#       isCompleted: false
#     - text: 'Забрать обувь из ремонта'
#       isCompleted: false
#  - title: 'Работа'
#    todos:
#     - text: 'Позвонить заказчику'
#       isCompleted: true
#     - text: 'Отправить документы'
#       isCompleted: true
#     - text: 'Заполнить отчет'
#       isCompleted: false
#  - title: 'Прочее'
#    todos:
#     - text: 'Позвонить другу'
#       isCompleted: false
#     - text: 'Подготовиться к поездке'
#       isCompleted: false

Project.create([{title: 'Семья'}, {title: 'Работа'}, {title: 'Прочее'}])
Todo.create([
    {
        text: 'Купить молоко',
        isCompleted: false,
        projectId: 1
    },
    {
        text: 'Заменить масло в двигателе до 23 апреля',
        isCompleted: false,
        projectId: 1
    },
    {
        text: 'Отправить письмо бабушке',
        isCompleted: true,
        projectId: 1
    },
    {
        text: 'Заплатить за квартиру',
        isCompleted: false,
        projectId: 1
    },
    {
        text: 'Забрать обувь из ремонта',
        isCompleted: false,
        projectId: 1
    },
    #
    #
    #
    {
        text: 'Позвонить заказчику',
        isCompleted: true,
        projectId: 2
    },
    {
        text: 'Отправить документы',
        isCompleted: true,
        projectId: 2
    },
    {
        text: 'Заполнить отчет',
        isCompleted: false,
        projectId: 2
    },
    #
    #
    {
        text: 'Позвонить другу',
        isCompleted: false,
        projectId: 3
    },
    {
        text: 'Подготовиться к поездке',
        isCompleted: false,
        projectId: 3
    },
])