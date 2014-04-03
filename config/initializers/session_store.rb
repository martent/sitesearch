Rails.application.config.session_store :cookie_store, {
  key: Rails.env.test? ? "_site_search_test_session" : "_site_search_session",
  secure: false,
  httponly: true
}
