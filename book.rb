class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @id = rand(1..1000)
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.rentals << rental
  end

  def available?
    rentals.none? { |rental| rental.return_date.nil? }
  end

  def rented_by?(person)
    rentals.any? { |rental| rental.person == person && rental.return_date.nil? }
  end
end
