# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

universities = University.create([{name: 'NCSU'}, {name: 'DUKE'}, {name: 'UCB'}, {name: 'USC'}])
admin = Admin.new
admin.email = 'qwang20@ncsu.edu'
admin.password = 'qwang20'
admin.save!
admin1 = Admin.new
admin1.email = 'rwu5@ncsu.edu'
admin1.password = 'rwu5rwu5'
admin1.save!
admin2 = Admin.new
admin2.email = 'yzhu48@ncsu.edu'
admin2.password = 'yzhu48'
admin2.save!

student1 = Student.new
student1.email = 'qwang20@ncsu.edu'
student1.password = 'qwang20'
student1.name = 'Qingyan Wang'
student1.education_level = 1
student1.university_id = 1
student1.save!
student2 = Student.new
student2.email = 'rwu5@ncsu.edu'
student2.password = 'rwu5rwu5'
student2.name = 'Ruiwen Wu'
student2.education_level = 2
student2.university_id = 2
student2.save!
student3 = Student.new
student3.email = 'yzhu48@ncsu.edu'
student3.password = 'yzhu48'
student3.name = 'Yongjian Zhu'
student3.education_level = 3
student3.university_id = 3
student3.save!


Library.create(name: 'The James B. Hunt Jr. Library', university: universities.first, location: "1070 Partners Way, Raleigh", max_day_can_borrow: '7', overdue_fine: '5')
Library.create(name: 'D. H. Hill Jr. Library', university: universities.first, location: "2 W Broughton Dr, Raleigh", max_day_can_borrow: '7', overdue_fine: '5')
Library.create(name: 'Duke Library1', university: universities.second, location: "Duke Library address1", max_day_can_borrow: '7', overdue_fine: '5')
Library.create(name: 'Duke Library2', university: universities.second, location: "Duke Library address2", max_day_can_borrow: '7', overdue_fine: '5')
Library.create(name: 'UCB Library1', university: universities.third, location: "UCB Library address1", max_day_can_borrow: '7', overdue_fine: '5')
Library.create(name: 'UCB Library2', university: universities.third, location: "UCB Library address2", max_day_can_borrow: '7', overdue_fine: '5')
Library.create(name: 'USC Library', university: universities.fourth, location: "USC Library address", max_day_can_borrow: '7', overdue_fine: '5')
Book.create(isbn: '987-3-16-148410-0', title: 'Dog Heaven', is_special_collection: '0', university: universities.first, library:Library.find_by(name: 'The James B. Hunt Jr. Library'))
Book.create(isbn: '987-3-16-148410-5', title: 'Cat Heaven', is_special_collection: '1', university: universities.first, library:Library.find_by(name: 'The James B. Hunt Jr. Library'))
Book.create(isbn: '987-3-16-148410-2', title: 'Dog Heaven', is_special_collection: '0', university: universities.first, library:Library.find_by(name: 'The James B. Hunt Jr. Library'))
Book.create(isbn: '987-3-16-148410-7', title: 'The Way to Succeed', is_special_collection: '0', university: universities.first, library:Library.find_by(name: 'D. H. Hill Jr. Library'))
Book.create(isbn: '987-3-16-148410-7', title: 'The Way to Succeed', is_special_collection: '0', university: universities.second, library:Library.find_by(name: 'Duke Library1'))
Book.create(isbn: '987-3-16-148410-8', title: 'How to be a Millionaire', is_special_collection: '1', university: universities.second, library:Library.find_by(name: 'Duke Library2'))
Book.create(isbn: '987-3-16-148410-7', title: 'The May to Succeed', is_special_collection: '0', university: universities.second, library:Library.find_by(name: 'Duke Library2'))
Book.create(isbn: '987-3-16-148410-3', title: 'I am a Book of UCB', is_special_collection: '0', university: universities.third, library:Library.find_by(name: 'UCB Library1'))
Book.create(isbn: '987-3-16-148410-4', title: 'Could not Think of a Title Anymore', is_special_collection: '0', university: universities.fourth, library:Library.find_by(name: 'USC Library'))
Book.create(isbn: '987-3-16-148410-6', title: 'No Symbol in Book Name', is_special_collection: '1', university: universities.fourth, library:Library.find_by(name: 'USC Library'))
StudentCurrentBorrowList.create(student: Student.find_by(email: 'qwang20@ncsu.edu'), book: Book.find_by(id: '1'))
StudentCurrentBorrowList.create(student: Student.find_by(email: 'rwu5@ncsu.edu'), book: Book.find_by(id: '5'))
StudentCurrentBorrowList.create(student: Student.find_by(email: 'yzhu48@ncsu.edu'), book: Book.find_by(id: '8'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '1'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '2'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '3'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '4'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '5'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '6'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '7'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '8'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '9'))
LibraryBookList.create(number: '10', book: Book.find_by(id: '10'))