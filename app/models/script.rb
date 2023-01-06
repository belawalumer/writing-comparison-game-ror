class Script < ApplicationRecord
  attr_accessor :virtual_user
  DEFAULT_VALUE = 0

  belongs_to :user
  has_one :point,  dependent: :destroy
end
