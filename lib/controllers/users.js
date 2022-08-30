const { Router } = require('express');
const UserService = require('../services/UserService');
const authenticate = require('../middleware/authenticate');



const ONE_DAY_IN_MS = 1000 * 60 * 60 * 24;

module.exports = Router()
  .post('/', async (req, res, next) => {
    try {
      const user = await UserService.create(req.body);
      const sessionToken = await UserService.signIn(req.body);

      res
        .cookie(process.env.COOKIE_NAME, sessionToken, {
          httpOnly: true,
          maxAge: ONE_DAY_IN_MS,
        })
        .json({ message: 'Signed in successfully!' });
    } catch(error) {
      next(error);
    }
  })
  .post('/session', async (req, res, next) => {
    try {
      const sessionToken = await UserService.signIn(req.body);

      res
        .cookie(process.env.COOKIE_NAME, sessionToken, {
          httpOnly: true,
          maxAge: ONE_DAY_IN_MS,
        })
        .json({ message: 'Signed in successfully!' });
    } catch (error) {
      next(error);
    }
  })

  .get('/session', authenticate, (req, res) => {
    res.json(req.user);
  })

  
  .delete('/session', authenticate, (req, res) => { 
    res
      .status(200)
      .clearCookie(process.env.COOKIE_NAME, {
        httpOnly: true,
        maxAge: ONE_DAY_IN_MS,
      })
      .json({ message: 'signed out!' })
  
    ;
  });


