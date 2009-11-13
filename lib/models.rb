class Eatery
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :nullable => false, :unique => true
  property :website, String
  property :phone, String
  property :created_at, DateTime

  has n, :orders
end

class Order
  include DataMapper::Resource

  property :id, Serial
  property :volunteer, String
  property :eatery_id, Integer, :nullable => false
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :eatery
  has n, :order_items
end

class OrderItem
  include DataMapper::Resource

  property :id, Serial
  property :meal, String, :nullable => false
  property :cost, Float, :nullable => false
  property :owner, String, :nullable => false
  property :order_id, Integer, :nullable => false

  belongs_to :order
end