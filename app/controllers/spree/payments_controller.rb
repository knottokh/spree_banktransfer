module Spree
  class PaymentsController < Spree::StoreController
    #before_action :authenticate_spree_user!
    before_action :find_payment

    def update
      if params.has_key?(:payment)
        unless @payment.order.payment_state == "paid" 
          payment_details = PaymentDetails.new(@payment, payment_params)
          if payment_details.save
            flash[:notice] = Spree.t(:payment_successfully_updated)
          else
            flash[:error] = payment_details.errors.to_sentence
          end
        end  
        #redirect_to :back
        redirect_back fallback_location: root_path
      else
        redirect_to :back  
      end  
      
    end

    def find_payment
      @payment = Spree::Payment.find_by(number: params[:id])
      unless @payment
        flash[:error] = Spree.t(:payment_not_found)
        #redirect_to :back
        redirect_back fallback_location: root_path
      end
    end

    private
      def payment_params
        params.require(:payment).permit(:bank_attachment)
      end
  end
end
