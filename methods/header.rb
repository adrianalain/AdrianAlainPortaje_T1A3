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
        puts rainbow(HEADER_LINE).red
        puts "Please Wait...".upcase.center(HEADER_LENGTH)
        puts rainbow(HEADER_LINE).red
        puts
        sleep(0.1)
    end
end


def welcome(hotel)
    puts
    puts rainbow(HEADER_LINE).red
    puts "WELCOME TO".center(HEADER_LENGTH)
    puts "#{hotel.name} Booking Site".center(HEADER_LENGTH)
    puts rainbow(HEADER_LINE).red
    puts
end

# header for when placing a new booking
def new_booking_header
    clear
    puts
    puts rainbow(HEADER_LINE).red
    puts "Create a new booking!".upcase.center(HEADER_LENGTH)
    puts rainbow(HEADER_LINE).red
    puts
end
