const { Router } = require('express');
const Regulation = require('../models/Regulation');
const authenticate = require('../middleware/authenticate');

module.exports = Router()

  .get('/', async (req, res, next) => {
    try {
      const allRegs = await Regulation.getAll();
      res.json(allRegs);
    } catch(error) {
      next(error);
    }
  })

  .get('/:id', authenticate, async (req, res, next) => {
    try {
      const regDetail = await Regulation.getById(req.params.id);
      res.json(regDetail);
    } catch (error) {
      next(error);
    }
  })

  .put('/:id', authenticate, async (req, res, next) => {
    try {
      const update = await Regulation.updateById(req.params.id, req.body);
      res.json(update);
    } catch(error) {
      next(error);
    }
  });







