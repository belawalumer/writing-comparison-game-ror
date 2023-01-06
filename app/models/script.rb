class Script < ApplicationRecord
  attr_accessor :virtual_user
  DEFAULT_VALUE = 0

  belongs_to :user
  has_one :point, dependent: :destroy

  after_create :default_point_for_essay

  private

  def default_point_for_essay
    Point.create(
      value: DEFAULT_VALUE,
      user_id: self.user&.id,
      script_id: id
    )
  end
end
