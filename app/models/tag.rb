class Tag < ActiveRecord::Base
  belongs_to :book
  has_many :book, dependent: :destroy
end
