# let's put all the students in an array
@students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "football", country_of_birth: "Holland", height: "5ft 10in" },
  {name: "Darth Vader", cohort: :november, hobbies: "football", country_of_birth: "Death Star", height: "5ft 11in" },
  {name: "Nurse Ratched", cohort: :november, hobbies: "football", country_of_birth: "England", height: "5ft 9in" },
  {name: "Michael Corleone", cohort: :november, hobbies: "football", country_of_birth: "Italy", height: "5ft 8in" },
  {name: "Alex DeLarge", cohort: :november, hobbies: "football", country_of_birth: "England", height: "5ft 7in" },
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "rugby", country_of_birth: "England", height: "5ft 8in" },
  {name: "Terminator", cohort: :november, hobbies: "rugby", country_of_birth: "USA", height: "5ft 9in" },
  {name: "Freddy Krueger", cohort: :november, hobbies: "rugby", country_of_birth: "USA", height: "6ft 1in" },
  {name: "The Joker", cohort: :november, hobbies: "CrossFit", country_of_birth: "USA", height: "5ft 9in" },
  {name: "Joffrey Baratheon", cohort: :november, hobbies: "CrossFit", country_of_birth: "England", height: "5ft 6in" },
  {name: "Norman Bates", cohort: :november, hobbies: "CrossFit", country_of_birth: "USA", height: "6ft 0in" }
  ]
  
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
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
  when "3"
    save_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_names_beginning_with(students)
  puts "Do you want to search for students by first letter? Type 'yes' or 'no'.".center(200)
  answer = gets.chomp
  while answer == "yes"
    puts "Enter the letter you want to search for.".center(200)
    letter = gets.chomp
    puts "Names beginning with #{letter}:".center(200)
    students.each_with_index do |student , index|
      if student[:name].start_with? letter.to_s
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), hobbies: #{student[:hobbies]}, country of birth: #{student[:country_of_birth]}, height: #{student[:height]}".center(200)
      end 
    end
    puts "Do you want to search for another letter?".center(200)
    answer = gets.chomp
  end
end

def print_names_shorter_than_12_char(students)
  puts "Do you want to print name shorter than 12 characters?".center(200)
  answer = gets.chomp
  if answer == "yes"
    students.each_with_index do |student , index|
      name = (student[:name]).to_s
      name_length = name.length
      if name_length <= 12
        puts "Names shorter than 12 characters:".center(200)
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), hobbies: #{student[:hobbies]}, country of birth: #{student[:country_of_birth]}, height: #{student[:height]}".center(200)
      end 
    end
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#nothing happen until we call the methods
interactive_menu