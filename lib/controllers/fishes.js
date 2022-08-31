const { Router } = require('express');

const { Fish } = require('../models/Fish');

module.exports = Router().get('/', async (req, res, next) => {
  try {
    const allFish = await Fish.getAll();
    console.log('hello from fishes controller', allFish);
    res.json(allFish);
  } catch (e) {
    next(e);
  }
});

// .get('/:species/location', async (req, res, next) => {
//   try {
//     const response = await fetch(
//       `https://www.fishwatch.gov/api/species/${req.params.species}`
//     );
//     const data = await response.json();
//     const info = {};
//     info.location = data[0].Location;
//     info.bycatch = data[0].Bycatch;
//     // const json = JSON.parse(data);
//     res.json(info);
//   } catch (e) {
//     next(e);
//   }
// });
