const { Router } = require('express');
const Regulation = require('../models/Regulation');
const authenticate = require('../middleware/authenticate');


const router = Router();

router
  .get('/', async (req, res, next) => {
    try {
      const allRegs = await Regulation.getAll();
      res.json(allRegs);
    } catch(error) {
      next(error);
    }
  })


  .get('/:id', authenticate, (req, res) => {
    const id = req.params.id;
    const regMatch = regs.find((reg) => reg.id === id);
    res.json(regMatch);
  });

module.exports = router;
