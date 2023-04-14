require './person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def can_use_services?
    true
  end
end
