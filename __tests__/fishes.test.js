const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const app = require('../lib/app');
const request = require('supertest');


const registerAndLogin = async () => {
  const agent = request.agent(app);
  await agent
    .post('/api/v1/users/session')
    .send({ email: 'admin', password: 'admin' });
  return [agent];
};

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });

  it('#PUT /fishes/:id/ should update an existing fish detail', async () => {
    const [agent] = await registerAndLogin({
      email: 'admin',
    });
    const resp = await agent.put('/api/v1/fishes/3').send({
      detail:
        'Bigeye tuna are dark metallic blue on the back and upper sides and white on the lower sides and belly.',
    });
    expect(resp.status).toEqual(200);
    expect(resp.body.detail).toBe(
      'Bigeye tuna are dark metallic blue on the back and upper sides and white on the lower sides and belly.'
    );
  });

  it('#POST /fishes/ should create a new fish entry', async () => {
    const [agent] = await registerAndLogin({ email: 'admin' });
    const newFish = {
      name: 'Tilapia',
      detail: 'This fish is mainly found in the fresh water lake',
    };
    const resp = await agent.post('/api/v1/fishes').send(newFish);
    expect(resp.status).toBe(200);
    expect(resp.body).toEqual({
      id: expect.any(String),
      ...newFish,
    });
  });

  it('#GET /fishes should return a list of all fishes', async () => {
    const response = await request(app).get('/api/v1/fishes');

    expect(response.status).toBe(200);
    expect(response.body[0]).toEqual({
      id: expect.any(String),
      name: expect.any(String),
      detail: expect.any(String),
    });
  });

  it('DELETE /fishes/:id should delete an existing fish', async () => {
    const [agent] = await registerAndLogin({ email: 'admin' });
    const deleteFish = await agent.put('/api/v1/fishes/delete/1');
    expect(deleteFish.status).toEqual(200);
    expect(deleteFish.body).toEqual({ 
      name: 'Red-Fish',
      id: expect.any(String),
      detail: 'fish is not in database',
    });
  
  });
});

