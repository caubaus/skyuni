Rails.configuration.stripe = {
  :publishable_key => 'pk_test_JV5Jbg6B4HiINFxBZVAxFiZZ',
  :secret_key      => 'sk_test_O6UdBexf97cEuXduamO2xVrX'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
