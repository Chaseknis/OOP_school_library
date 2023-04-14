require './app'

def display_options
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Add a person (Techer or Student)'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
end

def handle_choice(choice, app) # rubocop:disable Metrics/CyclomaticComplexity
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    print 'Person ID: '
    person_id = gets.chomp.to_i
    app.list_rentals(person_id)
  when 7
    handle_quit(app)
  else
    handle_invalid_choice
  end
end

def handle_quit(app)
  puts 'Thank you for using the Library App. Goodbye!'
  app.exit
end

def handle_invalid_choice
  puts 'Invalid choice, type the correct number!'
end

def main
  app = App.new

  puts 'Welcome to the School Library App!'

  loop do
    display_options
    print 'Enter your choice: '
    choice = gets.chomp.to_i
    handle_choice(choice, app)
  end
end

main
