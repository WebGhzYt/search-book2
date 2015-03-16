class Issuer < ActiveRecord::Base
	has_many :book, dependent: :destroy
end
