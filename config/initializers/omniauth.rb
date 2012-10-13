OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, '1XORKWj5BlY2S9Qgj2XcCQ', 'xPzTKU39KjhuPcXKQq1w6xbzj2Mk77K8EvK1TGQEnQ'
  provider :facebook, '290522874380679', '76d54a2261e0509534fcc5b173cd37c8'
end
