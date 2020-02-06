def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #gets the first name"
  name=gets.chomp
  #while the anme is not empty repeat this code
  while !name.empty? do
    #add the student hash to the array
    students<<{name: name,cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name
    name = gets.chomp
  end
  #return the ararys of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
