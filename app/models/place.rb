class Place
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :photo, type: String
  field :notes, type: String

  embedded_in :user
end
