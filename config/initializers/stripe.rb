# Add Stripe API Key

#Stripe.api_key = Rails.application.credentials.dig(Rails.env.to_sym, :stripe, :secret)

if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret].present?
    Stripe.api_key = Rails.application.credentials[:stripe][:secret]
  end