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
                days_avail.push{{name: days.to_s, disabled: "Booked"}}
            else
                days_avail.push(name: day.to_s)
            end
        end
    end

    def selecting_days_select(days_avail, days_select)
        TTY::Prompt.new.multi_select("Please select the day you want to book: ", days_avail, cycle = true, marker: '>', echo: false, per_page: 7).each do |day|
            @avail[day.to_sym] = "Not Available"
            days_select.push(day)
        end
    end

    class Checkup < Services
        def initialize
            super("Check-Up and Clean"["Dental Periodic Exam", "Supra-gingival Cleaning and Flouride Treatment", "Bite-wing X-Rays"], 250, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Closed"})
        end 
    end 

    class Gum < Services
        def initialize
            super("Gum Cleaning"["Helpdetect, treat, and prevent gum disease", "Test for bacteria abd biology that may lead to dental decay"], 400, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Closed"})
        end 
    end

    class Children < Services
        def initialize
            super("Children's Dentistry"["Oral Hygiene and Diet", "X-rays", "Gum Health", "Dental Developemtn",], 150, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Closed"})
        end 
    end
end
