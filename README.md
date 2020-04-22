This houses the REST API for the Money Trail app.

# Steps to run locally
1). bundle install

2). rails -s -p 3001

Note that you may need to create a User before attempting to use the API. See the API section below.

# API
The major routes of the API can be broken down into two parts: protected & unprotected. Protected routes are only available to logged-in Users.

## Unprotected
* /login
  * POST - log a User in
* /logout
  * DELETE - log a User out
* /logged_in 
  * GET - check the logged-in status of a User
* /users
  * POST - create a user (used when signing a user up)

## Protected
* /users/:user_id/expenses
  * GET - get expenses for the User
  * POST - create an expense for the User
* /users/:user_id/expenses/:id
  * GET - get details about a user's expense
  * PUT - replace a user's expense
  * PATCH - partially update a user's expense
  * DELETE - delete a user's expense
* /users/:user_id/categories
  * GET - get categories for the User
  * POST - create a category for the User
* /users/:user_id/categories/:id
  * GET - get details about a user's category
  * PUT - replace a user's category
  * PATCH - partially update a user's expense
  * DELETE - delete a user's category
* /users/:id
  * GET - get details about a user
  * PUT - replace a user
  * PATCH - partially update a user's information
  * DELETE - delete a user