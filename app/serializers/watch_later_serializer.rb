class WatchLaterSerializer < ActiveModel::Serializer
  attributes :id, :title, :poster, :user_id
end
