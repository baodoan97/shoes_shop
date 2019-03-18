Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['sk_test_Hm0ywtd94a4e27SHOfzVJLpZ']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]