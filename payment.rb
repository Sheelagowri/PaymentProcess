# frozen_string_literal: true

class PaymentProcess
  def initialize(user)
    @user = user
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def process
    @items.each(&:process)
  end
end
class Item
  attr_accessor :type
  def initialize(type, price, title)
    @type = type
    @price = price
    @title = title
  end

  def process
    raise 'not implemented'
  end
end
class Book < Item
  def initialize(price, _title)
    super('book', type, price)
  end

  def process
    if @agent
      @agent.add_commision('price')
    else
      Printer.new('Printing mailing label.').print
    end
  end

  def add_agent(agent)
    @agent = agent
  end
end
class Agent
  def initialize(name)
    @name = name
  end

  def add_commision(price)
    @price = price
    Printer.new('Sending commission to the agent.').print
  end
end
class Stove
  def initialize(brand, price)
    @brand = brand
    @price = price
  end

  def process
    Printer.new('Printing "Safety instructions"').print
  end
end
class DigitalItem
  def initialize(name, price)
    @name = name
    @price = price
  end

  def process
    send_email
  end

  def send_email
    Printer.new('Sending email to download digital items.').print
  end
end
class Membership
  def initialize(name, id)
    @name = name
    @id = id
  end

  def process
    upgrade_membership
  end

  def upgrade_membership
    Printer.new('Upgrading the user to "pro" account.').print
  end
end
class Printer
  def initialize(message)
    @message = message
  end

  def print
    puts @message
  end
end
b1 = Book.new(50, 'cartoon')
b2 = Book.new(100, 'My book')
b2.add_agent(Agent.new('ABC'))
prestige = Stove.new('prestige', 1000)
activation_key = DigitalItem.new('activation_key', 100)
m = Membership.new('Arr', 123)
pp = PaymentProcess.new('user1')
pp.add_item(b1)
pp.add_item(b2)
pp.add_item(m)
pp.add_item(prestige)
pp.add_item(activation_key)
pp.process
