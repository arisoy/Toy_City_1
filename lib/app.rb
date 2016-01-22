require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)

puts file

toys_data = JSON.parse(file)

puts toys_data.class


# Print today's date
require 'date'

current_time = DateTime.now

date_today = current_time.strftime "%d/%m/%Y"

puts "Today's date is: " + date_today 

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "
 
  toys_data["items"].each { |toy| 
    puts toy["title"] #prints name of the toy
    puts "**************************************"   #Saperator
    puts "The retail price : " + toy["full-price"].to_s + " USD" #prints retail price of the toy
    puts "Total Purchases  : #{toy["purchases"].length.to_i}" #prints total number of purchases
    
    total_amount = 0    # Calculates and prints the total amount of sales
    toy["purchases"].each { |purchase|
    total_amount += purchase["price"].to_f
    }
    puts "Total Sales      : #{total_amount} USD"

    total_amount = 0                            # Calculate and print the average price the toy sold for  !!!!!!!!!!!!!!!!!!!!wrong               
    toy["purchases"].each { |purchase|
      total_amount += purchase["price"].to_f
    }
    puts "Average Price    : #{total_amount/toy["purchases"].length} USD" 

    puts "Average Discount : #{toy["full-price"].to_f - total_amount/toy["purchases"].length} USD"
    

    puts "                                      " #Empty Line
    }
  


  puts " _                         _     "
  puts "| |                       | |    "
  puts "| |__  _ __ __ _ _ __   __| |___ "
  puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
  puts "| |_) | | | (_| | | | | (_| \\__ \\"
  puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
  puts

unique_brands = toys_data["items"].map { |item| item["brand"] }.uniq
  unique_brands.each_with_index do |brand, index|
    
    puts brand
      brand_toys = toys_data["items"].select { |item| item["brand"] == brand }

      average_price = 0
      total_revenue = 0

      brand_toys.each { |toy| average_price += toy["full-price"].to_f}
      puts average_price

      brand_toys.each { |toy| total_revenue += toy["price"].to_f}

      puts total_revenue


end
  
      
  # Calculate and print the average price of the brand's toys
  
  # Calculate and print the total revenue of all the brand's toy sales combined

