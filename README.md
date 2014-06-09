API USAGE DOCUMENTATION
READ ME

Authentication:
none required

Content Type:
application/json

Body:
You may pass JSON in the body
  

API Requests:
##################################
Account requests:

# List all accounts
GET
URL: /api/accounts
Body: none

# Show single account
GET
URL: /api/accounts/:id
Body: none

# Create new account
POST
URL: /api/accounts
Body: JSON
example: 	{
		“name”: ”Bilbo Baggins”
		}

# Update account
PUT
URL: /api/accounts/:id
Body: JSON
example: 	{
		“name”: ”Frodo Baggins”
		}

# Delete account
DELETE
URL: /api/accounts/:id
Body: none

##################################
Domain requests:

# List all domains associated to an account
GET
URL: /api/accounts/:id/domains
Body: none

# Show single domain
GET
URL: /api/accounts/:id/domains/:id
Body: none

# Create new domain under a particular account
POST
URL: /api/accounts/:id/domains
Body: JSON
example: 	{
		“hostname”: ”www.google.com”
		}

# Update domain
PUT
URL: /api/accounts/:id/domains/:id
Body: JSON
example: 	{
		“hostname”: ”www.updatedhost.com”
		}

# Delete domain
DELETE
URL: /api/accounts/:id/domains/:id
Body: none
