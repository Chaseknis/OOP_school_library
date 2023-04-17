class Rental
  attr_accessor :date, :person, :book, :id

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    @id = rand(1..1000)

    # Update rentals lists of Person and Book
    person.rentals << self
    book.rentals << self
  end
end
