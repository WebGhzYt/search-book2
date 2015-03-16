class Tag < ActiveRecord::Base
  belongs_to :book

searchable do
  text :name,:publish_month ,:stored => true

  time :created_at
  string :publish_month
end

def publish_month
  created_at.strftime("%B %Y")
end
end
