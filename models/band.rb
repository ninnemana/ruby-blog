# sample models.

class Band
  include Mongoid::Document
  field :name, type: String
  embeds_many :photos, as: :photographic
  has_one :address, as: :addressable
  validates_presence_of :name
end

class Photo
  include Mongoid::Document
  embedded_in :photographic, polymorphic: true
end

class Address
  include Mongoid::Document
  belongs_to :addressable, polymorphic: true
end