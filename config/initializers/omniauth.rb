Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ynab, ENV['YNAB_ID'], ENV['YNAB_SECRET']
end
