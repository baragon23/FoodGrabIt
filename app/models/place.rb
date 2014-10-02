class Place
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :photo, type: String
  field :notes, type: String

  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true

end
