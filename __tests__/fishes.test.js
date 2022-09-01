const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const app = require('../lib/app');
const request = require('supertest');

// const mockUser = {
//   username: 'mock',
//   password: '123456',
//   email: 'test@example.com',
// };

const registerAndLogin = async () => {
  // const password = userProps.password ?? mockUser.password;
  const agent = request.agent(app);
  // const user = await agent
  //   .post('/api/v1/users')
  //   .send({ ...mockUser, ...userProps });
  // console.log('User', user.body);
  // const { email } = user;
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
    // console.log('response', resp.body);
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
    // expect(resp.status).toBe(200);
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
    const [agent] = await registerAndLogin({ email: 'admin', password: 'admin' });
    // console.log('agent', agent);
    const res = await agent.delete('/api/v1/fishes/1');
    expect(res.status).toEqual(200);
    expect(res.body.id).toEqual('1');
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
