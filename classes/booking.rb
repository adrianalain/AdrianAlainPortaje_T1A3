require 'rainbow'
require_relative '../methods/header.rb'

class Booking
    attr_reader :days

    def initialize (item, days)
        @item = item
        @days = days
    end 

    def display_booking(dental, dental_info)
        puts rainbow(HEADER_LINE).red
        puts "#{dental.name.upcase} Appointment".center(HEADER_LENGTH)
        puts rainbow(HEADER_LINE).red
        puts
        puts rainbow(HEADER_LINE).red
        puts "Item:  #{@item.type}"
        @item.display_features
        puts
        puts "Appointment Days: "
        @days.each { |day| puts "      #{day}" }
        puts
        puts "#{@days.length} days @ $#{@item.price} each".rjust(HEADER_LENGTH)
        puts "Total Price: $#{'%.2f' % price}".rjust(HEADER_LENGTH)
    end
    #calculating booking price
    def price
        return @item.booking_price.to.f * @days.length
    end
end
