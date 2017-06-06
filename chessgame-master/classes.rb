class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.assign_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    multiplier * salary
  end

  def assign_manager(man)
    @boss=man
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super
    @employees=[]
  end

  def assign_employee(emp)
    employees << emp
  end

  def get_subordinate_sum
    sum = 0
    employees.each do |emp|
      if emp.is_a?(Manager)
        sum += emp.get_subordinate_sum
      end
      sum += emp.salary
    end
    sum
  end

  def bonus(multiplier)
    amount = multiplier*get_subordinate_sum
    amount
  end
end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
