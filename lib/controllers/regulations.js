const { Router } = require('express');
const { regs } = require('../../data/data2');


const router = Router();

router
  .get('/', (req, res) => {
    const regData = regs.map((reg) => ({ id: reg.id, name: reg.name, region: reg.region, rules: reg.rules, seasons: reg.seasons }));
    res.json(regData);
  })


  .get('/:id', (req, res) => {
    const id = req.params.id;
    const regMatch = regs.find((reg) => reg.id === id);
    res.json(regMatch);
  });

module.exports = router;
