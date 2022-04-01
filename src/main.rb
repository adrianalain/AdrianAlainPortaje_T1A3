require 'tty-prompt'
require 'rainbow'
require_relative './classes/booking'
require_relative './classes/car'
require_relative './classes/info'
require_relative './classes/services'
require_relative './methods/header'

car = CarInfo.new.add_items(Klugger.new).add_items(Mustang.new).add_items(MiniCooper.new)

clear
welcome(car)

#Enter clients name
puts "Please provide your name: "

user = 0

while user < 2
    user = gets.chomp.capitalize

    if user != ""
        clear
        break

    else
        user += 1
        if user == 2
            clear
            puts "You didn't put name"
            user = "No Name"
        else
            puts "Please enter your name: "
        end
    end
end

usr = CarName.new(user)
puts Rainbow("Hello #{usr.name}").red
puts 

while true
    welcome(car)
    selection = TTY::Prompt.new.select("How can I help you? Please select(Spacebar to choose): ", cycle: true, marker: '>', echo: false) do |menu|
        menu.choice('Book a Car', 1)
        menu.choice('View Booking', 2)
        menu.choice('View Car Rental Information', 3)
        menu.choice('Exit', 4)

        case selection
        when 1
            if usr.booking
                clear
                welcome(car)
                puts Rainbow("You have a booking already").red
                puts
            else
                new_appointment
                item = car.select_item

                new_appointment
                item.display_item
                item.display_summ
                appointment_days = item.selecting_days

                while appointment_days.length == 0
                    new_appointment
                    puts "No days selected"
                    appointment_days = item.selecting_days
                end

                usr.booking = Booking.new(item, appointment_days)
                loading_screen("Loading......")

                clear
                puts "Thank you for appointment"
                usr.booking.display_booking(usr,item)
                main_menu
            end
        when 2
            if usr.booking
                clear
                usr.booking.display_booking(usr, car)
                main_menu
            else
                clear
                welcome(car)
                puts Rainbow("You don't have a booking yet").red
                puts
            end
        when 3
            clear
            car.info
            main_menu

        when 4
            if usr.booking
                clear
                puts Rainbow("Thank you #{user}").red
                puts Rainbow("We look forward on seeing you on #{usr.booking.days[0]}").red
                return

            else
                clear
                puts Rainbow("Thank you #{user}").red
                puts Rainbow("Have a wonderful day!").red
                return
            end
        end
    end
end