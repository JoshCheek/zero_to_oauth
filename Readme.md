Rails App from Zero to Oauth
============================

From `$ rails new` to successfully authorized with Oauth against Twitter.

[Here](https://github.com/JoshCheek/zero_to_oauth/commits/master)
are the individual commits.

Videos of writing the code

1. New app through beginning of sign in with Twitter https://vimeo.com/162817133
2. Signing in and out, accessing current user https://vimeo.com/162817134
3. Managing secret keys with dotenv https://vimeo.com/162817135


Deviations from the presentation
--------------------------------

* We need to reset capybara between tests, or it will retain the same set of cookies,
  which corresponds to keeping the user logged in, a state you should eplicitly request.
