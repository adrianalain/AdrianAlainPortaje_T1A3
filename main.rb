require 'tty-prompt'
require 'rainbow'
require_relative './classes/booking'
require_relative './classes/dental'
require_relative './classes/info'
require_relative './classes/services'
require_relative './methods/header'

dental = DentalInfo.new.add_items(Checkup.new).add_items(Gum.new).add_items(Children.new)

clear
welcome(dental)

#Enter clients name

puts "Please provide your name: "

user = 0

while user < 2
    user = gets.chomp.capitalize

    if user != " "
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

usr = DentalName.new(user)
puts Rainbow("Hello #{usr.name}").red

while true

    selection = TTY::Prompt.new.select("How can I help you? Please select: ", cycle: true, marker: '>', echo: false) do |menu|
        menu.choice('Book an Appointment', 1)
        menu.choice('View Booking', 2)
        menu.choice('View Services', 3)
        menu.choice('View Dental Information', 4)
        menu.choice('Exit', 5)

        case selection
        when 1
            if usr.booking
                clear
                welcome(dental)
                puts "You have a booking already"

            else
                new_appointment
                item = dental.select_item

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
                loading_screen("Loading....")

                clear
                puts "Thank you for appointment"
                usr.booking.display_booking(usr,item)
                main_menu
            end
        when 5
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