Spree::Payment.class_eval do
  attr_accessor :validate_bank_details
  #validates :bank_attachment, presence: true, if: :validate_bank_details
  has_attached_file :bank_attachment
    
  validates_attachment_content_type :bank_attachment, content_type: /\Aimage\/.*\z/ , if: :validate_bank_details

  scope :from_bank_transfer, -> { joins(:payment_method).where(spree_payment_methods: { type: 'Spree::PaymentMethod::BankTransfer' }) }

  self.whitelisted_ransackable_attributes = %w( transaction_reference_no state )

  def details_submitted?
    transaction_reference_no?
  end
end
