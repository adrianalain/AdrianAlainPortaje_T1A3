require 'rainbow'
def login
    puts
    puts "Username: "
    vuser = gets.chomp
    puts "Password: "
    vpass = gets.chomp
    File.open("credentials.txt", "r") do |file|
    isValidUser = file.read().include? "#{vuser}, #{vpass}"
    if isValidUser == true
        puts
        puts Rainbow("Succesfully Login").green
        puts
        puts Rainbow("Hi #{vuser.upcase}!").green
        booking_menu_options(vuser)
    else
        puts Rainbow("Invalid credentials. Please try again!").red
        puts
        login
    end
    end
end
