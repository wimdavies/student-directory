@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  cohorts = [
    :january,
    :february,
    :march,
    :april,
    :may,
    :june,
    :july,
    :august,
    :september,
    :october,
    :november,
    :december,
    :no,
  ]
  
  while true do
    puts "Name:"
    name = STDIN.gets.chomp
    break if name.empty?
  
    cohort = nil
    loop do
      puts "Cohort:"
      user_cohort = STDIN.gets.chomp.downcase
      if user_cohort == 'no' || cohorts.include?(user_cohort.to_sym)
        cohort = user_cohort.to_sym
        break
      else
        puts "Invalid cohort. Enter a valid cohort, or 'no':"
      end
    end
    
    @students << {name: name, cohort: cohort}
    
    #printing grammatically correct counts
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list
  if @students.count > 0
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
  end
end

#printing grammatically correct counts
def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(50)
  else
    puts "Overall, we have #{@students.count} great students".center(50)
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  #open the file file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the the method if nothing is given
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
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
    exit # will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
 loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu