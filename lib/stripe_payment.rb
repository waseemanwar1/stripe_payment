# frozen_string_literal: true

require_relative "stripe_payment/version"

module StripePayment
  class Payment
    require 'stripe'

    def initialize(stripe_secret_key)
      Stripe.api_key = stripe_secret_key
    end

    def create(params)
      token = create_token(params[:card_number], params[:card_exp_month], params[:card_exp_year], params[:card_cvc])
      charge = create_charge(params[:amount], params[:currency], params[:description], token.id)
    end

    def create_token(card_number, card_exp_month, card_exp_year, card_cvc)
      Stripe::Token.create({
        card: {
          number: card_number,
          exp_month: card_exp_month,
          exp_year: card_exp_year,
          cvc: card_cvc
        }
      })
    end

    def create_charge(amount, currency, description, token_id)
      Stripe::Charge.create({
        amount: amount * 100,
        currency: currency,
        description: description,
        source: token_id
      })
    end
  end
end
