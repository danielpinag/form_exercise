class Score
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :qualification, type: Float
  field :subject, type: String
end