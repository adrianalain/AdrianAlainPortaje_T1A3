require 'rainbow'
require_relative '../methods/header.rb'

class Booking
    attr_reader :days

    def initialize (item, days)
        @item = item
        @days = days
    end 

    def display_booking(dental, dental_info)
        puts Rainbow(HEADER_LINE).red
        puts "#{dental.name.upcase} Appointment".center(HEADER_LENGTH)
        puts Rainbow(HEADER_LINE).red
        puts "Item:  #{@item.type}"
        @item.display_summ
        puts
        puts "Appointment Days: "
        @days.each { |day| puts "      #{day}" }
        puts
        puts "#{@days.length} days @ $#{@item.price} each".center(HEADER_LENGTH)
        puts "Total Price: $#{'%.2f' % price}".center(HEADER_LENGTH)
    end
    #calculating booking price
    def price
        return @item.price.to_f * @days.length
    end
end
