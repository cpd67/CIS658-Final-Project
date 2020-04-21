# https://medium.com/how-i-get-it/react-with-rails-user-authentication-8977e98762f2
if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_money-trail', domain: 'https://money-trail-app.herokuapp.com/'
else
    Rails.application.config.session_store :cookie_store, key: '_money-trail', domain: 'localhost'
end