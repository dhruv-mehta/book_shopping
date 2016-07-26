class Order < ActiveRecord::Base

has_many :line_items ,  dependent: :destroy

PAYMENT=['check' , 'credit Card' , 'Purchase Order'].freeze
validates :name  , :address ,:pay_type , :presence => true


def process_payment(total_price, desc)
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: total_price.to_i * 100,
                          description: desc,
                          currency: 'usd'

  end

end
