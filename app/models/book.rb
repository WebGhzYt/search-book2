class Book < ActiveRecord::Base
has_many :tag, dependent: :destroy
 belongs_to :tag

searchable do
# @sunspot_serarch = Sunspot.search Book do
  text :title
  text :author, :publish_month
  time :created_at
  string :publish_month
end

def publish_month
  created_at.strftime("%B %Y")
end

end
