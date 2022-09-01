const { Router } = require('express');
const authenticate = require('../middleware/authenticate');
const authorize = require('../middleware/authorize');
const { Fish } = require('../models/Fish');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const allFish = await Fish.getAll();
      res.json(allFish);
    } catch (e) {
      next(e);
    }
  })

  .get('/:id', async (req, res, next) => {
    try {
      const fishId = await Fish.getByID(req.params.id);
      res.json(fishId);
    } catch (e) {
      next(e);
    }
  })

  .put('/:id', authenticate, authorize, async (req, res, next) => {
    try {
      const updateFish = await Fish.updateById(req.params.id, req.body);
      res.json(updateFish);
    } catch (e) {
      next(e);
    }
  })

  .post('/', authenticate, authorize, async (req, res, next) => {
    try {
      const newFish = await Fish.insertFish(req.body);
      res.json(newFish);
    } catch (e) {
      next(e);
    }
  })


  .put('/delete/:id', authenticate, async (req, res, next) => {
    try {
      const deleteFish = await Fish.updateById(req.params.id, { detail: 'fish is not in database' });
      res.json(deleteFish);
    } catch (e) { 
      next(e);
    }
  });
  
