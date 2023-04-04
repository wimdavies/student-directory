def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  
  while true do
    puts "Name:"
    name = gets.chomp
    break if name.empty?
    
    puts "Cohort:"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "None"
    end
    cohort.to_sym
    
    puts "Country of birth:"
    country_of_birth = gets.chomp
    
    puts "Height:"
    height = gets.chomp
    
    students << {name: name, cohort: cohort, country_of_birth: country_of_birth, height: height}
    
    puts "Now we have #{students.count} students"
  end
  
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  longest_name_length = students.map { |student| student[:name].length }.max
  
  students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(longest_name_length + 50)
  end
end

def print_footer(students)
  puts puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)