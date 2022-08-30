const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
    
  
  it('should pull al regs', async () => {
    const res = await request(app).get('/api/v1/regulations');
    console.log(res.body);
    expect(res.body.length).toEqual(20);
      
  });
    
  afterAll(() => {
    pool.end();
  });
});
