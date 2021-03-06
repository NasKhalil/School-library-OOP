require './corrector'
require './rental'

class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  attr_accessor :name, :age
  attr_reader :id, :rentals

  def can_use_service
    of_age || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age
    @age >= 18
  end
end
