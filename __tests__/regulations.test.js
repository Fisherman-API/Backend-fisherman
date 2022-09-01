const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');


const newReg = {
  name: 'Snapper',
};

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

  it('should pull all regulation', async () => {
    const resp = await request(app).get('/api/v1/regulations');
    expect(resp.body[0]).toEqual({
      details: expect.any(String),
      name: expect.any(String),
      id: expect.any(String),
    });
  });

  it('/:id should get individual regulation', async () => {
    const [agent] = await registerAndLogin();
    const resp = await agent.get('/api/v1/regulations/1');
    expect(resp.body).toEqual({
      id: '1',
      name: expect.any(String),
      details: expect.any(String),
    });
  });

  it('#PUT /:id should update regulations', async () => {
    const [agent] = await registerAndLogin({ email: 'admin' });
    const updatedResp = await agent.put('/api/v1/regulations/1').send(newReg);
    expect(updatedResp.status).toBe(200);
    expect(updatedResp.body.name).toBe('Snapper');
  });

  it('/:id should delete a regulation from fish for DB maintenance', async () => {
    const [agent] = await registerAndLogin({ email: 'admin' });
    const deleteReg = await agent.put('/api/v1/regulations/delete/1');
    expect(deleteReg.body).toEqual({
      name: 'Red-Fish',
      id: expect.any(String),
      details: 'restricted species',
    });
  });


  it('/fishReg/:id will get regulation by fish with details', async () => {
    const [agent] = await registerAndLogin({ email: 'admin' });
    const res = await agent.get('/api/v1/regulations/fishReg/2');
    expect(res.body).toEqual({
      id: expect.any(String),
      name: expect.any(String),
      details: expect.any(String),
      detail: expect.any(String),
    });
  });



  afterAll(() => {
    pool.end();
  });
});
