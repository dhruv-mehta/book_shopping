# Preview all emails at http://localhost:3000/rails/mailers/order_notify
class OrderNotifyPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notify/received
  def received
    OrderNotify.received
  end

end
