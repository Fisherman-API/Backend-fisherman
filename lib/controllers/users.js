const { Router } = require('express');
const UserService = require('../services/UserService');



const ONE_DAY_IN_MS = 1000 * 60 * 60 * 24;

module.exports = Router()
  .post('/', async (req, res, next) => {
    try {
      const [user, token] = await UserService.create(req.body);
      res.cookie(process.env.COOKIE_NAME, token, {
        httpOnly: true,
        maxAge: ONE_DAY_IN_MS,
      })
        .json({ user,  message: 'successfully signed in!' });
    } catch(e) {
      next(e);
    }
  });
