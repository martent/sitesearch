module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:github] = {
      provider: "github",
      uid: "user-1",
      info: {
        name: "First Last",
        nickname: "user-1",
        email: "first.last@example.org"
      },
      extra: {
        raw_info: {
          organizations_url: "http://example.org"
        }
      }
    }
  end
end
