class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include PersonalInfo

  field :email, type: String
  field :name, type: String
  field :last_name, type: String
  field :mobile_phone, type: String
  field :work_place, type: String
  field :age, type: Integer
  field :is_active, type: Boolean, default: true
  field :relatives_number, type: Hash

  has_many :scores, dependent: :destroy
  embeds_many :parents

  accepts_nested_attributes_for :scores

  scope :adults, -> { where(age: {'$gte': 18} ) }
  scope :recently_adults, -> { where(age: 18) }
  default_scope -> { where(is_active: true ) }

  validates_presence_of :email, :name
  validates :email, uniqueness: true

  def full_name
    "#{name} #{last_name}"
  end

  def self.other_adults
    where(age: {'$gte': 18} )
  end

  def inactive!
    update(is_active: false)
  end

  def active
    update(is_active: true)
  end
end