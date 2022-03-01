def input_students
  puts "Please enter the details of the students"
  puts "To finish, hit return four times"

  students = []
  
  puts "Name"
  name = gets.chomp
  puts "Cohort"
  cohort = gets.chomp
  cohort = "March" if cohort.empty?
  puts "Country of birth"
  country = gets.chomp
  puts "Height in centimetres"
  height = gets.chomp


  while !name.empty? && !country.empty? && !height.empty? do
    
    students << {name: name, 
                cohort: cohort, 
                country: country, 
                height: height}

    puts "Now we have #{students.count} students"

    puts "Name"
    name = gets.chomp
    puts "Cohort"
    cohort = gets.chomp
    cohort = "March" if cohort.empty?
    puts "Country of birth"
    country = gets.chomp
    puts "Height in centimetres"
    height = gets.chomp
    
  end

  students
end

def print_header
  puts ("The students of Villains Academy").center(50)
  puts ("-------------").center(50, "------------------")
end

def print_march(students)
  march_students = students.select {|student| student[:cohort] == "March" }
  march_students.each.with_index(1) do |student, index|
    puts ("#{index}. #{student[:name]} (#{student[:cohort]} cohort)").center(50)
  end
end

def print_footer(students)
  march_students = students.select {|student| student[:cohort] == "March" }
  if march_students.length == 1
    puts ("Overall, we have #{march_students.count} great student").center(50)
  else
    puts ("Overall, we have #{march_students.count} great students").center(50)
  end
end

students = input_students
if students.length == 0
  break
end
print_header
print_march(students)
print_footer(students)