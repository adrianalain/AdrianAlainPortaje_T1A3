require 'tty-prompt'
require 'rainbow'
require 'tty-font'
require 'pastel'

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
    string.length.times do |load| 
        clear
        puts Rainbow(HEADER_LINE).red
        puts "Loading.......".upcase.center(HEADER_LENGTH)
        puts Rainbow(HEADER_LINE).red
        puts
        sleep(0.2)
    end
end


def welcome(car)
    font = TTY::Font.new(:standard)
    pastel = Pastel.new
    puts
    puts Rainbow(HEADER_LINE).red
    puts pastel.cyan(font.write("WELCOME TO", font_size: 12)).center(HEADER_LENGTH)
    puts pastel.cyan(font.write("#{car.name} Rental Site")).center(HEADER_LENGTH)
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

