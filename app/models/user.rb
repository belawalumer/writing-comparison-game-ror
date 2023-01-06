class User < ApplicationRecord
    has_many :scripts,  dependent: :destroy
    has_many :points,  dependent: :destroy
end
