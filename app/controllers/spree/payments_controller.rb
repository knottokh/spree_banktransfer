module Spree
  class PaymentsController < Spree::StoreController
    before_action :authenticate_spree_user!
    before_action :find_payment

    def update
      unless @currentorder.payment_state == "paid" 
        payment_details = PaymentDetails.new(@payment, payment_params)
        if payment_details.save
          flash[:notice] = Spree.t(:payment_successfully_updated)
        else
          flash[:error] = payment_details.errors.to_sentence
        end
      end  
      #redirect_to :back
      redirect_back fallback_location: root_path
    end

    def find_payment
      @payment = spree_current_user.payments.find_by(number: params[:id])
      @currentorder = spree_current_user.payments.joins(:order).find_by(number: params[:id])
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
