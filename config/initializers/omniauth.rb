OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'LgFaHV7lTCz0ytKHmP6kqw', 'YkyO1zquB0zROpYgi3I3NPBgdaboKNV3MR1YYxRXU'
  provider :facebook, '1374521139443218','7bb1222405f5c885c916adbdd96496fe',{:scope => 'publish_stream,offline_access,email'}
end