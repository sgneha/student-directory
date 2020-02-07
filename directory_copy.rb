def input_students
  puts "Please enter details of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  #create an empty array
  students = []
  while true do
    puts "Name of the student"
    name = gets.chomp
    #while the name is not empty repeat this code
    if name.empty?
      break
    end
    puts "Hobby"
    hobby = gets.chomp
    puts"Height of the student"
    height = gets.chomp
    puts"Country"
    country = gets.chomp
    #add the student hash to the array
    students<<{name: name,hobby: hobby, height: height, country: country, cohort: :november}
    puts "Now we have #{students.count} students"
  end
  #return the ararys of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end
def print(students)
  count = 0
  while count < students.length
    puts "Name: #{students[count][:name]}, #{students[count][:cohort]} Cohort, Hobby: #{students[count][:hobby]}, Height: #{students[count][:height]}, Country: #{students[count][:country]}"
    count+=1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

