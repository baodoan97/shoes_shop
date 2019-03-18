Rails.configuration.stripe = {
  :publishable_key => 'pk_test_2GtOFVYfb1TfR8pNqC201q5Y',
  :secret_key      => 'sk_test_Hm0ywtd94a4e27SHOfzVJLpZ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]