Deface::Override.new(
  virtual_path: 'spree/admin/payments/_list',
  name: 'add_payment_reference_details',
  insert_after: "#payments",
  text: %q{
    <% if bank_transfer_payment = @order.payments.from_bank_transfer.first %>
      <fieldset class="no-border-bottom" >
        <legend align="center"><%= Spree.t(:payment_reference_details) %></legend>
        <% unless bank_transfer_payment.bank_attachment_file_name.nil? %>
          <div class="media-left">
            <%=link_to image_tag(bank_transfer_payment.bank_attachment.url,class: 'media-object'), bank_transfer_payment.bank_attachment.url(:original), :popup=>['original_image', 'height=700,width=900'] %>
          </div>
        <% end %>
      </fieldset>
    <% end %>
  }
)
