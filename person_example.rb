require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(age: 22, name: 'maximilianus')
puts "Person's correct name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized person's correct name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and trimmed person's correct name: #{capitalized_trimmed_person.correct_name}"
