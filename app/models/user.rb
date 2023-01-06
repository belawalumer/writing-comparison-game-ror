class User < ApplicationRecord
    validates :name, uniqueness: true, presence: true

    has_many :scripts,  dependent: :destroy
    has_many :points,  dependent: :destroy
end
