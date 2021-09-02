class WatchLater < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :poster, presence: true
end
