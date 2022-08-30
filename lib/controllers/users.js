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
  })
  .delete('/sessions', authenticate, (req, res) => { 
    res
      .clearCookie(process.env.COOKIE_NAME, {
        httpOnly: true,
        secure: process.env.SECURE_COOKIES === 'true',
        sameSite: process.env.SECURE_COOKIES === 'true' ? 'none' : 'strict',
        maxAge: ONE_DAY_IN_MS,
      })
      .status(204)
      .send();
  });


