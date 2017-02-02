require 'rails_helper'

describe Image do
  it {should belong_to(:post)}
  it {should validate_presence_of(:url)}
end
