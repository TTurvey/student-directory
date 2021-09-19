# let's put all the students in an array
students = [
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

def input_students(students)
  puts "Do you want to add a student? Enter 'yes' or 'no'."
  user_input = gets.chomp
  puts "Please enter the name of the student that you want to add".center(200)
  name = gets.chomp
  puts "What cohort month are they in? e.g. 'november'."
  cohort = gets.chomp
  puts "What are their hobbies?"
  hobbies = gets.chomp
  puts "What is their country of birth?"
  country_of_birth = gets.chomp
  puts "What is their height?"
  height = gets.chomp

  if cohort == "" then cohort = "N/A" end
  if hobbies == "" then hobbies = "N/A" end
  if country_of_birth == "" then country_of_birth
    loop do
      students << {name: name, cohort: :november, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
      puts "Now we have #{students.count} students".center(200)
      name = gets.chomp
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(200)
  puts "-------------".center(200)
end

def print(students)
  # each_with_index allows you to print the array index too.
  students.each_with_index do |student , index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), hobbies: #{student[:hobbies]}, country of birth: #{student[:country_of_birth]}, height: #{student[:height]}".center(200)
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students".center(200)
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

#nothing happen until we call all the methods
input_students(students)
print_header
print(students)
print_footer(students)
print_names_beginning_with(students)
print_names_shorter_than_12_char(students)