Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'some-key', 'some-secret'
end
