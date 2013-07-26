Spree::OrderMailer.class_eval do
  helper 'spree/base'
  layout 'spree/layouts/email'  

  def comment_email(order)
      find_order(order)
      subject = "#{Spree::Config[:site_name]} #{t('order_mailer.comment.subject')} ##{@order.number}"
      mail(:to => @order.email, :from => from_address, :subject => subject)
  end
end
