const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');

const app = express();

// Built in middleware
app.use(cookieParser());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// App routes
app.use('/api/v1/users', require('./controllers/users'));
app.use('/api/v1/fishes', require('./controllers/fishes'));
app.use('/api/v1/regulations', require('./controllers/regulations'));

// Error handling & 404 middleware for when

app.use(require('./middleware/not-found'));
app.use(require('./middleware/error'));

module.exports = app;
