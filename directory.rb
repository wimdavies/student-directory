def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  
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
    name = gets.chomp
    break if name.empty?
  
    cohort = nil
    until cohorts.include?(cohort) do
      puts "Cohort:"
      cohort = gets.chomp.downcase.to_sym
      cohort = :no unless cohorts.include?(cohort)
    end
    
    students << {name: name, cohort: cohort}
    
    #printing grammatically correct counts
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
  end
  
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end
#printing grammatically correct counts
def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
  end
end

students = input_students
print_header
print(students)
print_footer(students)