Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['38161679262-jh9h2d98oenbi4v81g0ml7e5aqm1o6a6.apps.googleusercontent.com'], ENV['H0S8d5UUsDlAiNXpfEGYk7iu']
end