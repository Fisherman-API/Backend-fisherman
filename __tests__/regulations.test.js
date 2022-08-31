const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
    
  
  it('should pull al regs', async () => {
    const resp = await request(app).get('/api/v1/regulations');
    expect(resp.body[0]).toEqual({
      detail: expect.any(String),
      name: expect.any(String),
      id: expect.any(String),

    });
      
  });





  
    
  afterAll(() => {
    pool.end();
  });
});
