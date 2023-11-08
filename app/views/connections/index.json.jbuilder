# frozen_string_literal: true

json.array! @connections, partial: 'connections/connection', as: :connection
