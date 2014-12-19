# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

categories = ['Медикаменты',
              'Доп. снаряжение',
              'Прочее',
              'Оптика',
              'Инструмент',
              'Медтехника',
              'Продукты питания',
              'Специальное снаряжение',
              'Одежда и обувь',
              'Средства защиты',
              'Средства гигиены',
              'Атрибутика']

categories.each do |category|
  Category.where(name: category).first_or_create!
end