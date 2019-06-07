Rails.configuration.stripe = {
  publishable_key: 'pk_test_RzeE0Y6x35ftiTEQUhz9LSjj00fb8ZtjsY',
  secret_key: 'sk_test_wdVv7Hk8YLpEDoSxmCiaxEyp00p5Be9Ide'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
