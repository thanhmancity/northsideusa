ActionMailer::Base.smtp_settings = {
  :address              => "server.triplettrading.com",
  :port                 => 25,
  :domain               => "northsideusa.com",
  :user_name            => "jeffj",
  :password             => "1TripleT!",
  :authentication       => "plain",
  :enable_starttls_auto => true
}