class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    # Update rentals lists of Person and Book
    person.rentals << self
    book.rentals << self
  end

  # Other methods of Rental class
end
