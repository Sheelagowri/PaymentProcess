class Item
  attr_accessor :i_name, :i_quantity, :i_price_after_discount, :i_price_before_discount
  def initialize(i_name, i_quantity)
    @items_details = {
      "milk" => {  
        "unit_price" => 3.97,
        "sale_unit_price" => 2.50
      },
      "bread" => { 
        "unit_price" => 2.17, 
        "sale_unit_price" => 2.0, 
      }, 
      "apple" => { 
        "unit_price" => 0.89
      },"banana" =>{ 
        "unit_price" => 0.99 
      }
    }
    @i_name = i_name
    @i_quantity = i_quantity
    @i_price_after_discount = calculate_item_price_after_discount
    @i_price_before_discount = calculate_item_price_before_discount  
  end
  
  def calculate_item_price_after_discount
    case @i_name
    when "milk"
      sale_on_quantity = 2
      final_milk_price = discount_calculator(@items_details[@i_name]["unit_price"], @items_details[@i_name]["sale_unit_price"],sale_on_quantity)
      return final_milk_price 
    when "bread"
      sale_on_quantity = 3
      final_bread_price = discount_calculator(@items_details[@i_name]["unit_price"], @items_details[@i_name]["sale_unit_price"],sale_on_quantity)
      return final_bread_price
    when "banana"
      return @items_details[@i_name]["unit_price"] * @i_quantity
    when "apple"
      return @items_details[@i_name]["unit_price"] * @i_quantity
    end
  end

  def calculate_item_price_before_discount
    return @items_details[@i_name]["unit_price"] * @i_quantity
  end

  def discount_calculator(i_unit_price, i_sale_unit_price, sale_on_quantity)
    i_price_after_discount = 0 
    if @i_quantity < sale_on_quantity
      i_price_after_discount = i_unit_price * @i_quantity
      return i_price_after_discount
    end
    if @i_quantity >= sale_on_quantity
      i_price_after_discount = ((i_sale_unit_price * sale_on_quantity) * (@i_quantity / sale_on_quantity) ) + (i_unit_price * (@i_quantity % sale_on_quantity))
      return i_price_after_discount
    end
  end
end