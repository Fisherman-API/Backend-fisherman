const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');
const UserService = require('../lib/services/UserService');


const mockUser = {
  username: 'mock',
  password: '123456',
  email: 'test@example.com',
};

const newReg = {
  name: 'Snapper',
};

const registerAndLogin = async (userProps = {}) => {
  const password = userProps.password ?? mockUser.password;
  const agent = request.agent(app);
  const user = await UserService.create({ ...mockUser, ...userProps });
  const { email } = user;
  await agent.post('/api/v1/users/session').send({ email, password });
  return [agent, user];
};




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

  it('/:id should get individual regulation', async () => {
    const [agent] = await registerAndLogin();
    const resp = await agent.get('/api/v1/regulations/1');
    expect(resp.body).toEqual({
      id: '1',
      name: expect.any(String),
      detail: expect.any(String),
    });
  });

  it('/:id should update regulations', async () => {
    const [agent] = await registerAndLogin();
    const updatedResp = await agent.put('/api/v1/regulations/1').send(newReg);
    console.log(updatedResp.body);
    expect(updatedResp.status).toBe(200);
    expect(updatedResp.body.name).toBe('Snapper');
  });

  it('/:id should delete a regulation from fish for DB maintenance', async () => {
    const [agent] = await registerAndLogin();
    const deleteReg = await agent.put('/api/v1/regulations/delete/1');
    expect(deleteReg.body).toEqual({
      name: 'Red-Fish',
      id: expect.any(String),
      detail: 'restricted species'
    });
  });
  
    
  afterAll(() => {
    pool.end();
  });
});
