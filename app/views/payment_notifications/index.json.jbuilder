json.array!(@payment_notifications) do |payment_notification|
  json.extract! payment_notification, :params, :cart_id, :status, :transaction_id
  json.url payment_notification_url(payment_notification, format: :json)
end