require 'AASM'

class Payment
  include AASM

  aasm do
    state :awaiting_payment, initial: true
    state :in_analysis, :canceled, :paid, :in_dispute, :in_contestation, :available, :refounded, :chargedback

    event :analyze do
      transitions from: :awaiting_payment, to: :in_analysis
    end

    event :cancel do
      transitions from: [:awaiting_payment, :in_analysis], to: :canceled
    end

    event :pay do
      transitions from: [:awaiting_payment, :in_analysis, :in_contestation], to: :paid
    end

    event :dispute do
      transitions from: [:paid, :available], to: :in_dispute
    end

    event :contest do
      transitions from: [:paid, :in_dispute, :available], to: :in_contestation
    end

    event :make_available do
      transitions from: [:paid, :in_dispute, :in_contestation], to: :available
    end

    event :refound do
      transitions from: [:in_dispute, :available], to: :refounded
    end

    event :chargeback do
      transitions from: [:available, :in_contestation], to: :chargedback
    end
  end

  def check
    p "state: #{aasm.current_state}"
    p "may_analyze? #{may_analyze?}"
    p "may_cancel? #{may_cancel?}"
    p "may_pay? #{may_pay?}"
    p "may_dispute? #{may_dispute?}"
    p "may_contest? #{may_contest?}"
    p "may_make_available? #{may_make_available?}"
    p "may_refound? #{may_refound?}"
    p "may_chargeback? #{may_chargeback?}"
    p ""
  end
end
