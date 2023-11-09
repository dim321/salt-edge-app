# frozen_string_literal: true

# == Schema Information
#
# Table name: providers
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  mode       :integer          default("web"), not null
#  name       :string           not null
#  status     :integer          default("active"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Provider < ApplicationRecord
  enum :status, %i[active inactive disabled], prefix: true, default: :active
  enum :mode, %i[web oauth api file], suffix: true, default: :web

  has_many :connections

  def self.fakebank
    @fakebank ||= find_by_code('fakebank_simple_xf')
  end
end
