GET /posts index
GET /posts/:id
GET /posts/new
DELETE /posts/:id
PATCH /posts/:id
POST /posts
GET /posts/:id/edit

1. The client (browser) makes a GET request to a particular route
2. Sinatra catches that request and routes to the appropriate action in the controller
3. The controller asks the model for data
4. The model queries the database for the data
5. The model passes the data back to the controller
6. The controller passes that data to the view to render html
7. The view parses both the data and the html markup to create that html and passes that html back to the controller
8. The controller sends that html back to the client for the user to view
