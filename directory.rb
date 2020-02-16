@students = []
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv "
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end
def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
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
    name = STDIN.gets.strip
    #while the name is not empty repeat this code
    if name.empty?
      break
    end
    puts"Cohort"
    cohort = STDIN.gets.chop
    cohort = "January" if cohort == ""
    adding_students(name,cohort)
    # @students<<{name: name, cohort: cohort.to_sym}
    if @students.length ==1
      puts "Now we have 1 student"
      else
      puts "Now we have #{@students.count} students"
    end
  end
end

def adding_students(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
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
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students(filename ="students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    adding_students(name,cohort)
    # @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts"Sorry, #{filename} doesn't exist."
    exit
  end
end
try_load_students
interactive_menu
