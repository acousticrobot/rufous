# A simple example of getting a username and password from the command line:


puts "enter user name:"
@user_name = gets.strip

# doesn't show the user input:
puts "enter password: "
@password = STDIN.noecho(&:gets).strip

puts "user #{user_name} with password #{password}"
