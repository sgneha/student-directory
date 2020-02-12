def input_students
  puts "Please enter details of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  #create an empty array
  students = []
  while true do
    puts "Name of the student"
    name = gets.strip
    #while the name is not empty repeat this code
    if name.empty?
      break
    end
    puts "Hobby"
    hobby = gets.strip
    puts"Height of the student"
    height = gets.chop
    puts"Country"
    country = gets.chop
    puts"Cohort"
    cohort = gets.chop
    cohort = "January" if cohort == ""
    #add the student hash to the array
    students<<{name: name,hobby: hobby, height: height, country: country, cohort: cohort.to_sym}
    if students.length ==1
      puts "Now we have 1 student"
      else
      puts "Now we have #{students.count} students"
    end
  end
  #return the ararys of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end
def print(students)
# puts "Specify Cohort or All"
# input = gets.chomp
 students.sort_by!{|student| student[:cohort]}
 prev_cohort = ''
  students.each do|student|
    if prev_cohort != student[:cohort]
       prev_cohort = student[:cohort]
       puts "#{student[:cohort]} Cohort"
    end
    puts "Name: #{student[:name]}, Hobby: #{student[:hobby]}, Height: #{student[:height]}, Country: #{student[:country]}"
end
  # students.each do|student|
  #   if input.to_sym == student[:cohort]
  #     puts "Name: #{student[:name]}, Hobby: #{student[:hobby]}, Height: #{student[:height]}, Country: #{student[:country]}"
  #   elsif input == "All"
  #     puts "Name: #{student[:name]}, Hobby: #{student[:hobby]}, Height: #{student[:height]}, Country: #{student[:country]}, #{student[:cohort]} Cohort"
  #   end
  # end
#  count = 0
#  while count < students.length
#    puts "Name: #{students[count][:name]}, #{students[count][:cohort]} Cohort, Hobby: #{students[count][:hobby]}, Height: #{students[count][:height]}, Country: #{students[count][:country]}"
#    count+=1
#  end
end
def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(50)
  else
    puts "Overall, we have #{names.count} great students".center(50)
  end
end
#nothing happens until we call the methods
students = input_students
# if students.count == 0
#   puts "There are no students in the List"
#   exit
# end
print_header
print(students)
print_footer(students)
