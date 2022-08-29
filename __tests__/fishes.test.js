const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const app = require('../lib/app');
const request = require('supertest');

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });
  it(' get location and bycatch data', async () => {
    const res = await request(app).get('/api/v1/fishes/red-snapper/location');

    expect(res.body).toEqual({
      location:
        '<ul>\n<li>Red snapper are generally found at 30 to 620 feet deep in the Gulf of Mexico and along the eastern coasts of North America, Central America, and northern South America.</li>\n<li>They are rare north of the Carolinas.</li>\n</ul>\n',
      bycatch:
        'Regulations require modified fishing gear to reduce bycatch. Release techniques improve the chance of survival of unintentionally caught fish.',
    });
  });
});
