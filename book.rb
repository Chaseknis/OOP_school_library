class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @id = generate_unique_id # Call a method to generate a unique ID for the book during initialization
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

  private

  def generate_unique_id
    timestamp = Time.now.strftime('%Y%m%d%H%M%S%L')
    random_suffix = rand(1000..9999)
    "#{timestamp}#{random_suffix}"
  end
end
