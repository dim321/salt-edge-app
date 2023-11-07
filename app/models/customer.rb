# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  blocked_at :datetime
#  identifier :string           not null
#  secret     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_customers_on_identifier  (identifier)
#  index_customers_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Customer < ApplicationRecord
  belongs_to :user
  has_many :connections, dependent: :destroy
end
