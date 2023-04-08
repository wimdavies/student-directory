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

#transforms students to cohorts order, prints as above. Should be refactored to not require cohort repeat
def print_by_cohort(students)
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
  
  students.sort_by! do |student|
    cohorts.index(student[:cohort])
  end
  
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort})".center(50)
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
print_by_cohort(students)
print_footer(students)