shopping_list = []

def show_list(list)
  puts "\n🧾 Current Shopping List:"
  if list.empty?
    puts "No items yet."
  else
    list.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]} - RM#{'%.2f' % item[:price]}"
    end
  end
end

def total_price(list)
  list.sum { |item| item[:price] }
end

loop do
  puts "\n🛒 MENU: [A]dd  [U]pdate  [D]elete  [L]ist  [T]otal  [Q]uit"
  print "Choose an option: "
  choice = gets.chomp.downcase

  case choice
  when "a"
    print "Item name: "
    name = gets.chomp
    print "Estimated price (RM): "
    price = gets.chomp.to_f
    shopping_list << { name: name, price: price }
    puts "✅ Added #{name} - RM#{'%.2f' % price}"

  when "u"
    show_list(shopping_list)
    print "Enter item number to update: "
    index = gets.chomp.to_i - 1
    if shopping_list[index]
      print "New name (or press Enter to keep): "
      new_name = gets.chomp
      print "New price (or press Enter to keep): "
      new_price_input = gets.chomp

      shopping_list[index][:name] = new_name unless new_name.empty?

      unless new_price_input.strip.empty?
        new_price = new_price_input.to_f
        shopping_list[index][:price] = new_price
      end

      puts "✏️ Updated!"
    else
      puts "❌ Invalid item number."
    end


  when "d"
    show_list(shopping_list)
    print "Enter item number to delete: "
    index = gets.chomp.to_i - 1
    if shopping_list[index]
      removed = shopping_list.delete_at(index)
      puts "🗑️ Removed #{removed[:name]}"
    else
      puts "❌ Invalid item number."
    end

  when "l"
    show_list(shopping_list)

  when "t"
    puts "\n💰 Total Estimated Cost: RM#{'%.2f' % total_price(shopping_list)}"

  when "q"
    puts "👋 Goodbye!"
    break

  else
    puts "⚠️ Invalid option. Try again."
  end
end
