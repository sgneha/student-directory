@students = []
def interactive_menu
  # students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end
def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end
def show_students
  print_header
  print_student_list
  print_footer
end
def input_students
  puts "Please enter details of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  while true do
    puts "Name of the student"
    name = gets.strip
    #while the name is not empty repeat this code
    if name.empty?
      break
    end
    # puts "Hobby"
    # hobby = gets.strip
    # puts"Height of the student"
    # height = gets.chop
    # puts"Country"
    # country = gets.chop
    puts"Cohort"
    cohort = gets.chop
    cohort = "January" if cohort == ""
    @students<<{name: name, cohort: cohort.to_sym}
    if @students.length ==1
      puts "Now we have 1 student"
      else
      puts "Now we have #{@students.count} students"
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end
def print_student_list
  @students.each do|student|
    puts "Name: #{student[:name]} (#{student[:cohort]} Cohort)"
  end
end
def print_footer
  if @students.count == 0
    puts "No students added"
  elsif @students.count == 1
    puts "Overall, we have one great student".center(50)
  else
    puts "Overall, we have #{@students.count} great students".center(50)
  end
end
interactive_menu


# puts "Specify Cohort or All"
# input = gets.chomp
  # students.sort_by!{|student| student[:cohort]}
  # prev_cohort = ''
  # students.each do|student|
  #   if prev_cohort != student[:cohort]
  #      prev_cohort = student[:cohort]
  #      puts "#{student[:cohort]} Cohort"
  #   end
  #   puts "Name: #{student[:name]}"
  # end

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
#nothing happens until we call the methods

# if students.count == 0
#   puts "There are no students in the List"
#   exit
# end
