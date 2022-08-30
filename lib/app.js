const express = require('express');

const app = express();

// Built in middleware
app.use(express.json());

// App routes
app.use('/api/v1/users', require('./controllers/users'));
// Error handling & 404 middleware for when

app.use(require('./middleware/not-found'));
app.use(require('./middleware/error'));

module.exports = app;
