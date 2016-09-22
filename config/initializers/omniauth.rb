Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV['APP_KEY'], ENV['APP_SECRET'], scope: 'email', info_field: 'email, first_name, last_name'
    end