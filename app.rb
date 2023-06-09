require './person'
require './teacher'
require './student'
require './book'
require './rental'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'All Books:'
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}, Id: #{book.id}"
    end
  end

  def list_people
    puts 'All People:'
    people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person # rubocop:disable Metrics/MethodLength
    print 'To create a student type (1) and type (2) for a teacher? [Input the number]: '
    select_person = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    case select_person
    when 1
      print 'Has parent permission? [Y/N]: '
      choice = gets.chomp.downcase
      case choice
      when 'y'
        student = Student.new(age: age, name: name, parent_permission: true)
      when 'n'
        student = Student.new(age: age, name: name, parent_permission: false)
      else
        puts 'Invalid. Try again'
      end
      @people << student
      puts 'Student created successfully'
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name: name)
      puts 'Teacher created successfully'
    else
      puts 'Invalid choice. Choose 1 for student or 2 for teacher.'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created successfully with ID: #{book.id}"
  end

  def create_rental # rubocop:disable Metrics/MethodLength
    puts 'Choose the number of the book you want to rent:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}: Title: #{book.title} | Author: #{book.author} | ID: #{book.id}"
    end
    print 'Book ID: '
    book_id = gets.chomp.to_i
    puts 'Type your ID:'
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}"
    end
    print 'Person ID: '
    person_id = gets.chomp.to_i
    book = @books.find { |b| b.id == book_id }
    person = @people.find { |p| p.id == person_id }
    if book.nil?
      puts "Book not found with ID: #{book_id}"
    elsif person.nil?
      puts "Person not found with ID: #{person_id}"
    else
      rental = Rental.new(Time.now, person, book)
      @rentals << rental
      puts "Rental created: ID: #{rental.id}, Book: #{rental.book.title}, Person: #{rental.person.name}"
    end
  end

  def list_rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person not found with ID: #{person_id}"
    else
      puts "Rentals for Person ID: #{person_id} - #{person.name}:"
      person.rentals.each do |rental|
        puts "Rental ID: #{rental.id}, Book: #{rental.book.title}"
      end
    end
  end

  # Exit the app
  def exit
    Kernel.exit
  end
end
