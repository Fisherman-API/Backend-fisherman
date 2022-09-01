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

  afterAll(() => {
    pool.end();
  });

  it('#POST /user should create and sign in a new user', async () => {
    const res = await request(app).post('/api/v1/users').send(mockUser);

    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      message: 'Signed in successfully!',
    });
  });
  it('delete users session', async () => {
    const [agent] = await registerAndLogin();
    const resp = await agent.delete('/api/v1/users/session');
    expect(resp.status).toBe(200);
    expect(resp.body).toEqual({
      message: 'signed out!'
    });
  });
});
  
