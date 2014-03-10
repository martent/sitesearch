OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['SITESEARCH_GITHUB_KEY'], ENV['SITESEARCH_GITHUB_SECRET'], scope: "read:org,user:email"
end
