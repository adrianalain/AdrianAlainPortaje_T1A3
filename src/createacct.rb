def create_account
    File.open("credentials.txt", "a+") do |file|
        puts
        puts Rainbow("Creating an Account").red
        puts
        puts "Enter you username: "
        username = gets.chomp
        puts "Enter your password: "
        pwd = gets.chomp
        file.write "#{username}, #{pwd}\n"
        file.close
    end
end
