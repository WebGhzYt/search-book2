class Book < ActiveRecord::Base
searchable do
  text :title
  text :author, :publish_month
  time :created_at
  string :publish_month
end

def publish_month
  created_at.strftime("%B %Y")
end

end
