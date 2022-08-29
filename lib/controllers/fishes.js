const { Router } = require('express');
const fetch = require('cross-fetch');

module.exports = Router().get('/:species/location', async (req, res, next) => {
  try {
    const response = await fetch(
      `https://www.fishwatch.gov/api/species/${req.params.species}`
    );
    const data = await response.json();
    const info = {};
    info.location = data[0].Location;
    info.bycatch = data[0].Bycatch;
    // const json = JSON.parse(data);
    res.json(info);
  } catch (e) {
    next(e);
  }
});
