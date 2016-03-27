# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create! id: 1, name: "book", price: 12.49, basicSaleTaxes: false, imported: false, active: true
Product.create! id: 2, name: "music CD", price: 14.99, basicSaleTaxes: true, imported: false, active: true
Product.create! id: 3, name: "chocolate bar", price: 0.85, basicSaleTaxes: false, imported: false, active: true
Product.create! id: 4, name: "imported box of chocolates", price: 10.00, basicSaleTaxes: false, imported: true, active: true
Product.create! id: 5, name: "imported bottle of perfume", price: 47.50, basicSaleTaxes: true, imported: true, active: true
Product.create! id: 6, name: "imported bottle of perfume", price: 27.99, basicSaleTaxes: true, imported: true, active: true
Product.create! id: 7, name: "bottle of perfume", price: 18.99, basicSaleTaxes: true, imported: false, active: true
Product.create! id: 8, name: "packet of headache pills", price: 9.75, basicSaleTaxes: false, imported: false, active: true
Product.create! id: 9, name: "box of imported chocolates", price: 11.25, basicSaleTaxes: false, imported: true, active: true
