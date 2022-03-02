@students = []

def input_students
  puts "Please enter the details of the students"
  puts "To finish, hit return four times"  
  print "Name?  "
  name = gets.chomp
  print "Cohort?  "
  cohort = gets.chomp
  cohort = "March" if cohort.empty?
  print "Country of birth?  "
  country = gets.chomp
  print "Height in centimetres?  "
  height = gets.chomp


  while !name.empty? && !country.empty? && !height.empty? do
    
    @students << {name: name, 
                cohort: cohort, 
                country: country, 
                height: height}

    puts "Now we have #{@students.count} students"

    print "Name?  "
    name = gets.chomp
    print "Cohort?  "
    cohort = gets.chomp
    cohort = "March" if cohort.empty?
    print "Country of birth?  "
    country = gets.chomp
    print "Height in centimetres?  "
    height = gets.chomp

  end
  @students
end

def print_header
  puts ("The students of Villains Academy").center(50)
  puts ("-------------").center(50, "------------------")
end

def print_students_list
  @students.each.with_index(1) do |student, index|
    puts ("#{index}. #{student[:name]} (#{student[:cohort]} cohort)").center(50)
  end
end

def print_footer
  if @students.count == 1
    puts ("Overall, we have #{@students.count} great student").center(50)
  else
    puts ("Overall, we have #{@students.count} great students").center(50)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "5"
 
    when "6"

    when "7"
 
    when "8"

    when "9"
      exit 
    else
      puts "I'm not sure what you meant, try again"
      puts "Type a number"
  end
end

def interactive_menu
  loop do
    print_menu 
    process(gets.chomp)
  end
end


def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, country, height = line.chomp.split(',')
    @students << {name: name, 
                cohort: cohort, 
                country: country, 
                height: height}
  end
  file.close
end


interactive_menu

#If selecting for March later
#march_students = @students.select {|student| student[:cohort] == "March" }