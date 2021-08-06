require_relative './grocerystore.rb'
require 'terminal-table'
$Total_prices_after_discount = []
$Total_prices_before_discount = []
$items = []
$table_data = []
class Store
def self.enter_items
  puts "Please enter all the items purchased separated by a comma"
  $items = gets.chomp.split(',')
  
  create_item("milk") if $items.include?('milk')
  create_item( "bread") if $items.include?('bread')
  create_item("banana") if $items.include?('banana')
  create_item("apple") if $items.include?('apple')  
  display_bill_table
end

def self.create_item(i_name)
  quantity = $items.count(i_name) 
  single_item = Item.new(i_name, quantity)
  $table_data << [single_item.i_name, single_item.i_quantity, "$#{single_item.i_price_after_discount}"]
  $Total_prices_after_discount.push(single_item.i_price_after_discount)
  $Total_prices_before_discount.push(single_item.i_price_before_discount)
end

def self.display_bill_table 
  table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $table_data
  puts table
  total
end

def self.total
  amount_saved = ($Total_prices_before_discount.sum - $Total_prices_after_discount.sum).round(2)
  puts"\n Total price: $#{ $Total_prices_after_discount.sum.round(2)} \n You saved $#{amount_saved} today."
end
end
Store.enter_items
# milk,milk,bread,banana,bread,bread,bread,milk,apple