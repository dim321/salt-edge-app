# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id            :bigint           not null, primary key
#  amount        :decimal(19, 10)  default(0.0), not null
#  category      :string
#  currency_code :string(3)
#  description   :string
#  duplicated    :boolean
#  extra         :string
#  made_on       :datetime
#  mode          :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
