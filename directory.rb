@students = []
@name = ""
@cohort = ""
@country = ""
@height = ""
@filename = ""

def load_students
  if ARGV.first == nil
    @filename = "students.csv"
  end
  if File.exists?(@filename)
    File.open(@filename, "r") do |file|
      file.readlines.each do |line|
        @name, @cohort, @country, @height = line.chomp.split(',')
        student_info_to_hash
      end
    end
    puts "Loaded all students from #{@filename}"
  else
    puts "Sorry, #{@filename} doesn't exist."
    exit
  end
end

def student_info_to_hash
  @students << {name: @name, cohort: @cohort, country: @country, height: @height}
end

def interactive_menu
  loop do
    print_menu 
    process(STDIN.gets.chomp)
  end
end

def print_menu
  print "\n", "1. Input the students", "\n", "2. Show the students", "\n", "3. Save the students", "\n", "9. Exit", "\n"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      print "\n", "Your students have been saved to your selected file", "\n", "\n"
      save_students
    when "9"
      print "\n", "Thanks for visiting", "\n"
      exit 
    else
      print "I'm not sure what you meant, try again", "\n", "Type a number", "\n"
  end
end

def input_students
  print "\n", "Please enter the details of the students", "\n", "To finish, hit return four times", "\n"
  get_info_about_students
  while !@name.empty? && !@country.empty? && !@height.empty? do
    student_info_to_hash
    puts "The current total of students is #{@students.count}"
    get_info_about_students
  end
end

def get_info_about_students
  print "\n", "Name?  "  
  @name = STDIN.gets.chomp
  print "Cohort?  "  
  @cohort = STDIN.gets.chomp
  @cohort = "March" if @cohort.empty?
  print "Country of birth?  "  
  @country = STDIN.gets.chomp
  print "Height in centimetres?  "  
  @height = STDIN.gets.chomp
end

def show_students
  print "\n", ("The students of Villains Academy").center(50), "\n", ("-------------").center(50, "------------------"), "\n"
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:height]}cm, #{student[:country]})"
  end
  print ("-------------").center(50, "------------------"), "\n", ("That's all the students!").center(50), "\n", "\n"
end

def save_students
  File.open(@filename, "w") do |file|
    @students.each do |student|
      file.puts [student[:name], student[:cohort], student[:country], student[:height]].join(",")
    end
  end
end

load_students
interactive_menu

#If selecting for March later
#march_students = @students.select {|student| student[:cohort] == "March" }