require 'tty-prompt'
require_relative './createacct'


def main_menu_options
while true
  acct = TTY::Prompt.new.select("Please login if you have an existing account.(Spacebar to choose): ", cycle: true, marker: '>', echo: true) do |menu|
        menu.choice('Login', 1)
        menu.choice('Create an Account', 2)
        menu.choice('Exit', 3)

        case acct
        when 1
          login
        when 2
          create_account
        when 3
          puts
          puts Rainbow("We're sad to see you go! Looking forward to see you again!").red
          exit
        end
      end
   end
end