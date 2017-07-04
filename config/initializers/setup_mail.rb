ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address:                'smtp.sendgrid.net',
    port:                   '2525',
    authentication:          :plain,
    user_name:               'app72041618@heroku.com',
    password:                'nun4j9o80513',
    domain:                  'heroku.com',
    enable_starttls_auto:    true
}
 