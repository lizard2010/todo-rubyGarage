OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '341975405982394', 'f403dad63b04260db0f5556a5aae8664'
end