class Person
  def initilize initilize (name = "unknown", age, parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age 
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_service
    of_age || parent_permission == true
  end

  private

  def of_age
    @age >= 18
  end
end