require 'tty-prompt'
require 'rainbow'


HEADER_LINE = ("--------------------------------------------------------------")
HEADER_LENGTH = HEADER_LINE.length


def clear
    puts " "
end


def main_menu
    puts "\n\n Press any key to go back to the main menu"
    $stdin.getch
    clear
end

def loading_screen(string)                                           
    string.length.times do |i| 
        clear
        puts Rainbow(HEADER_LINE).red
        puts "Please Wait...".upcase.center(HEADER_LENGTH)
        puts Rainbow(HEADER_LINE).red
        puts
        sleep(0.1)
    end
end


def welcome(dental)
    puts
    puts Rainbow(HEADER_LINE).red
    puts "WELCOME TO".center(HEADER_LENGTH)
    puts "#{dental.name} Rental Site".center(HEADER_LENGTH)
    puts Rainbow(HEADER_LINE).red
    puts
end

# header for when placing a new booking
def new_appointment
    clear
    puts
    puts Rainbow(HEADER_LINE).red
    puts "Create a new booking!".upcase.center(HEADER_LENGTH)
    puts Rainbow(HEADER_LINE).red
    puts
end
