const { Router } = require('express');
const Regulation = require('../models/Regulation');
const authenticate = require('../middleware/authenticate');
const authorize = require('../middleware/authorize');

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

  .put('/:id', authenticate, authorize, async (req, res, next) => {
    try {
      const update = await Regulation.updateById(req.params.id, req.body);
      res.json(update);
    } catch(error) {
      next(error);
    }
  })

  // We cannot delete a fish because the fish would still exist,
  // but may be delisted from regulations, so this is a way to remove the regulations from a specific fish
  .put('/delete/:id', authenticate, authorize, async (req, res, next) => {
    try {
      const deleteReg = await Regulation.updateById(req.params.id, { details: 'restricted species' });
      res.json(deleteReg);
    } catch(e) {
      next(e);
    }
  })

  .get('/fishReg/:id', authenticate, authorize, async (req, res, next) => {
    try {
      const fishRegId = await Regulation.getFishRegDetail(req.params.id);
      res.json(fishRegId);
    } catch (e) {
      next(e);
    }
  });






