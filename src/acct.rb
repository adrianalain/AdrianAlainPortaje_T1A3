require 'tty-prompt'
require 'rainbow'
require_relative './methods/header'
require_relative './checkcred'

class Account
while true
  acct = TTY::Prompt.new.select("Please login if you have an existing account.Please select(Spacebar to choose): ", cycle: true, marker: '>', echo: true) do |menu|
        menu.choice('Login', 1)
        menu.choice('Create an Account', 2)
        menu.choice('Exit', 3)

        case acct
        when 1

        when 2
          File.open("accounts.txt", "a+") do |file|
            puts
            puts Rainbow("Creating an Account").red
            puts
            puts "Enter you username: "
            username = gets.chomp
            puts "Enter your password: "
            pwd = gets.chomp
            file.write "#{username}, #{pwd}\n"
            file.close
            clear
          end
        when 3
          puts
          puts Rainbow("We're sad to see you go! Looking forward to see you again!").red
          exit
        end
      end
   end
end