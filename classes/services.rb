require 'tty-prompt'
require 'rainbow'

class Services
    attr_reader :type, :summ, :price, :avail

    def initialize(type, summ, price, avail)
        @type = type #item name
        @summ = summ #summary of the type
        @price = '%.2f' % price
        @avail = avail #availability
    end

    def display_item
        puts "Service: #{@type}"
        puts "Price: $#{@price}"
    end

    def display_summ
        puts "Summary: "
        @summ.each { |summary| puts "    #{summ}"}
    end

    def display_avail
        puts "Available: "
        @avail.each { |day, status| puts "      #{day}: #{status}"}
    end

    def selecting_days
        days_avail = []
        days_select = []
        selecting_days_avail(days_avail)
        selecting_days_select(days_avail, days_select)
        return days_select
    end

    #it will take the items availability and formatis to tty-prompt
    def selecting_days_avail(days_avail)
        @avail.each do |day, status|
            if status != "Available"
                days_avail.push{{name: days.to_s, disabled: "Closed"}}
            else
                days_avail.push(name: day.to_s)
            end
        end
    end

    def selecting_days_select(days_avail, days_select)
        TTY::Prompt.new.multi_select("Please select the day you want to book: ", days_avail, cycle: true, marker: '>', echo: false, per_page: 7).each do |day|
            @avail[day.to_sym] = "Not Available"
            days_select.push(day)
        end
    end
end

    class Klugger < Services
        def initialize
            super("Klugger",["2 people capacity", "4-Star Ancap Rating"], 250, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Not Available"})
        end 
    end 

    class Mustang < Services
        def initialize
            super("Mustang",["7 people capacity", "4-Star Ancap Rating"], 400, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Not Available"})
        end 
    end

    class MiniCooper  < Services
        def initialize
            super("Mini Cooper",["5 people capacity", "3-Star Ancap Rating"], 150, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Not Available"})
        end 
    end