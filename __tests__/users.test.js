const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

const mockUser = {
  username: 'mock', 
  password: '123456',
  email: 'test@example.com'
};


describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  
  afterAll(() => {
    pool.end();
  });

  it('#POST /user should create and sign in a new user', async () => {
    const res = await request(app).post('/api/v1/users').send(mockUser);
    // console.log(res.body);

    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      user: {
        id: expect.any(String),
        email: 'test@example.com',
        username: 'mock'
      },
      message: 'successfully signed in!',
   
    });
  });

});
