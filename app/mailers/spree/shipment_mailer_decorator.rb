Spree::ShipmentMailer.class_eval do
  helper 'spree/base'
  layout 'spree/layouts/email'

  def shipped_email(shipment, resend = false)
      @shipment = shipment.is_a?(Spree::Shipment) ? shipment : Spree::Shipment.find(shipment)
      subject = (resend ? "[#{t(:resend).upcase}] " : '')
      subject += "#{Spree::Config[:site_name]} "
      if @shipment.shipping_method.name == "Osebni prevzem"
        subject += "Naročilo je pripravljeno na prevzem ##{@shipment.order.number}"
      else
        subject += "#{t('shipment_mailer.shipped_email.subject')} ##{@shipment.order.number}"
      end
      mail(:to => @shipment.order.email, :from => from_address, :subject => subject)
    end

end
