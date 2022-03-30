require 'tty-prompt'
require 'rainbow'
require_relative '../methods/header.rb'

class DentalInfo
    attr_reader :items, :name

    def initialize
        @name = "XYZ Dental"
        @address = "69 Nowhere Street"
        @items = []
    end
    def info
        puts rainbow(HEADER_LINE).red
        puts "#{name.upcase}".center(HEADER_LENGTH)
        puts rainbow(HEADER_LINE).red
    end
    #adds dental items
    def add_items(item)
        @items << item
        return self
    end

    #Selecting a dental item
    def select_item
        menu = []
        @items.each { |item| menu.push(item.type)}
    #Displays menu using tty prompt
    selects = TTY::Prompt.new.select("Choose an item: ",menu, cycle = true, marker: ">", echo: false)
        items.each{ |item| return item if item.type == selects }
    end
end

    