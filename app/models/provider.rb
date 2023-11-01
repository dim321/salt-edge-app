class Provider < ApplicationRecord
  enum :status, %i[active inactive disabled], prefix: true, default: :active
  enum :mode, %i[web oauth api file], suffix: true, default: :web
end
