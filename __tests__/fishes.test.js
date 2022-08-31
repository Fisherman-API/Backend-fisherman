const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const app = require('../lib/app');
const request = require('supertest');

const mockUser = {
  username: 'mock',
  password: '123456',
  email: 'test@example.com',
};

const registerAndLogin = async (userProps = {}) => {
  // const password = userProps.password ?? mockUser.password;
  const agent = request.agent(app);
  const user = await agent
    .post('/api/v1/users')
    .send({ ...mockUser, ...userProps });
  // const { email } = user;
  // await agent.post('/api/v1/users').send({ email, password });
  return [agent, user];
};

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });

  it.only('#GET /fishes should return a list of all fishes', async () => {
    const response = await request(app).get('/api/v1/fishes');

    expect(response.status).toBe(200);
    expect(response.body[0]).toEqual({
      id: expect.any(String),
      name: expect.any(String),
      detail: expect.any(String),
    });
  });
});

//   it.only(' get location and bycatch data', async () => {
//     const [agent] = await registerAndLogin();
//     const res = await agent.get('/api/v1/fishes/red-snapper/location');

//     expect(res.body).toEqual({
//       location:
//         '<ul>\n<li>Red snapper are generally found at 30 to 620 feet deep in the Gulf of Mexico and along the eastern coasts of North America, Central America, and northern South America.</li>\n<li>They are rare north of the Carolinas.</li>\n</ul>\n',
//       bycatch:
//         'Regulations require modified fishing gear to reduce bycatch. Release techniques improve the chance of survival of unintentionally caught fish.',
//     });
//   });
