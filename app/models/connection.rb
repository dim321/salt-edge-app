# == Schema Information
#
# Table name: connections
#
#  id                        :bigint           not null, primary key
#  categorization            :string
#  country_code              :string
#  daily_refresh             :boolean
#  last_attempt              :string
#  last_success_at           :datetime
#  next_refresh_possible_at  :datetime
#  provider_code             :string
#  provider_name             :string
#  secret                    :string
#  show_consent_confirmation :boolean
#  status                    :integer
#  store_credentials         :boolean
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  customer_id               :string
#  last_consent_id           :string
#  provider_id               :string
#
class Connection < ApplicationRecord
  enum :status, %i[active inactive disabled], prefix: true, default: :active
  belongs_to :customer
  belongs_to :provider
  has_many :accounts, dependent: :destroy
end
