# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id            :bigint           not null, primary key
#  balance       :decimal(19, 10)  default(0.0), not null
#  currency_code :string(3)
#  extra         :string
#  name          :string
#  nature        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  connection_id :bigint           not null
#
# Indexes
#
#  index_accounts_on_connection_id  (connection_id)
#
# Foreign Keys
#
#  fk_rails_...  (connection_id => connections.id)
#
class Account < ApplicationRecord
  belongs_to :connection
  has_many :transactions, dependent: :destroy
end
