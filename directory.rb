@students = [] # an empty array accessible to all methods

def push_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

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
    if name.empty?
      puts "Finished inputting students"
      break
    end
    
    cohort = nil
    loop do
      puts "Cohort:"
      user_cohort = STDIN.gets.chomp.downcase
      if user_cohort == 'no' || cohorts.include?(user_cohort.to_sym)
        cohort = user_cohort
        break
      else
        puts "Invalid cohort. Enter a valid month, or 'no':"
      end
    end
    
    push_student(name, cohort)
    
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
  #gets a user-specified filename
  puts "Enter name of file to save to:"
  filename = STDIN.gets.chomp
  #open the file file for writing
  File.open(filename, "w") do |file|
    #iterate over the array of students
      @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Students saved to #{filename}"
end

#user-specified filename
def load_students
  puts "Enter name of file to load from:"
  filename = STDIN.gets.chomp
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      push_student(name, cohort)
    end
  end
  puts "Loaded #{@students.count} from #{filename}."
end

# loads students.csv by default if file not supplied
def load_on_startup
  load_students if ARGV.empty?
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    puts "You selected: 1."
    input_students
  when "2"
    puts "You selected: 2."
    show_students
  when "3"
    puts "You selected: 3."
    save_students
  when "4"
    puts "You selected: 4."
    load_students
  when "9"
    puts "You selected: 9. Program will now exit."
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

load_on_startup
interactive_menu