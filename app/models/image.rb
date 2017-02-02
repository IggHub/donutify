class Image < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :post
  validates_presence_of :url
end
