# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  password   :string
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_one :profile
  accepts_nested_attributes_for :profile
  validates :email, :password, :role, presence: true
  validates :email, format: { with: /([\.\w\-]+@\w+\.\w{2,3}(?:\.?\.?\w{2,3})?)/ }
  validates :password, length: { minimum: 8, maximum: 30 }
end
