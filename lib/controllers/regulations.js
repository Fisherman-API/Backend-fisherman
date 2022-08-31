const { Router } = require('express');
const Regulation = require('../models/Regulation');
// const authenticate = require('../middleware/authenticate');


module.exports = Router()

  .get('/', async (req, res, next) => {
    try {
      const allRegs = await Regulation.getAll();
      res.json(allRegs);
    } catch(error) {
      next(error);
    }
  });





