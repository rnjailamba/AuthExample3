Rails new authexample3

Add devise to the gemfile

Bundle

rails g devise:install

rails g devise users

rails g devise :controllers users

Now wrap up the above two commands on the routes.rb file

Add simple_token_auth to gemfile

Follow steps given there and make the token a field for the user

Few imp things:

	responds_to:json

	skip_before_filter:verify signed out user

Now change(override) the registrations controller and the 

sessions controlller and following curl commands will work.


Create user on console:
User.create(email: "useddr@example.com",                  password: "foddobar", password_confirmation: "foddobar")

Create user with curl:
curl -H "Content-Type: application/json" -d '{"user":{"email":"sjors@purpledunes.com","password":"12345678","password_confirmation":"12345678"}}' -X POST http://localhost:3000/users

Sign in with curl:
curl -H "Content-Type: application/json" -d '{"user":{"email":"sjoddddrs@purpledunes.com","password":"12345678","password_confirmation":"12345678"}}' -X POST http://localhost:3000/users/sign_in

Sign Out with curl:
curl -i -H "Accept: application/json" -H "Content-type: application/json" -H "X-User-Email: sjdors@purpledunes.com" -H "X-User-Token: ZVvXRkRZGYMtVV1z6F6c" -X DELETE http://localhost:3000/users/sign_out

Going for active admin  Now:
