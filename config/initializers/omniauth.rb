OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
      APP_CONFIG['omniauth']['github_key'],
      APP_CONFIG['omniauth']['github_secret'],
      scope: "read:org,user:email"
end
