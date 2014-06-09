API USAGE DOCUMENTATION :: READ ME
=================================

System Requirements:
+ Ruby 2.0.0
+ Rails 4.0.3


Authentication:
+ none required


Content Type:
+ application/json


Body:
+ You may pass only JSON in the body
  


API Requests:
=============

Account requests:
----------------

List all accounts

+ Method: GET
+ URL: /api/accounts
+ Body: none

Show single account

+ Method: GET
+ URL: /api/accounts/:id
+ Body: none

Create new account

+ Method: POST
+ URL: /api/accounts
+ Body: JSON
+ example: 	
	{
	“name”: ”Bilbo Baggins”
	}

Update account

+ Method: PUT
+ URL: /api/accounts/:id
+ Body: JSON
+ example:
	{
	“name”: ”Frodo Baggins”
	}

Delete account

+ Method: DELETE
+ URL: /api/accounts/:id
+ Body: none

Domain requests:
---------------

List all domains associated to an account

+ Method: GET
+ URL: /api/accounts/:id/domains
+ Body: none

Show single domain

+ Method: GET
+ URL: /api/accounts/:id/domains/:id
+ Body: none

Create new domain under a particular account

+ Method: POST
+ URL: /api/accounts/:id/domains
+ Body: JSON
+ example:
	{
	“hostname”: ”www.google.com”
	}

Update domain

+ Method: PUT
+ URL: /api/accounts/:id/domains/:id
+ Body: JSON
+ example:
	{
	“hostname”: ”www.updatedhost.com”
	}

Delete domain

+ Method: DELETE
+ URL: /api/accounts/:id/domains/:id
+ Body: none
