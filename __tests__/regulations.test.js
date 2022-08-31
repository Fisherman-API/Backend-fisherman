const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
    
  
  it('should pull al regs', async () => {
    const resp = await request(app).get('/regulations');
    expect(resp.body).toEqual([
      { id: expect.any(String),
        name: expect.any(String),
        detail: expect.any(String),
      }
    ]);
      
  });





  
    
  afterAll(() => {
    pool.end();
  });
});
