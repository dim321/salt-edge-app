json.extract! transaction, :id, :account_id, :duplicated, :mode, :status, :made_on, :amount, :currency_code, :description, :category, :extra, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
