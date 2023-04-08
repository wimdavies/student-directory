@students = [] # an empty array accessible to all methods

# todo: refactor cohorts as an instance variable here

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
    name = gets.delete("\n")
    break if name.empty?
  
    cohort = nil
    loop do
      puts "Cohort:"
      user_cohort = gets.delete("\n").downcase
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
  if @students.count > 1
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
  end
end

#transforms students to cohorts order, prints as above. Should be refactored to not require cohort repeat
def print_by_cohort
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
  
  @students.sort_by! do |student|
    cohorts.index(student[:cohort])
  end
  
  #only prints list if at least one student was inputted
  if @students.count > 1
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort})".center(50)
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


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
 loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu