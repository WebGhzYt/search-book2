class Book < ActiveRecord::Base
has_many :tag, dependent: :destroy
 belongs_to :issuer

searchable do
  text :title, :stored => true
  text :author, :publish_month
  time :created_at
  string :publish_month
end

def publish_month
  created_at.strftime("%B %Y")
end

end
