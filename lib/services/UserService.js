const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

module.exports = class UserService {
  static async create({ username, email, password }) {
    if (email.length < 5) {
      throw new Error('Invalid email');
    }

    if (password.length < 5) {
      throw new Error('Password must be at least 6 characters long');
    }

    const passwordHash = await bcrypt.hash(
      password,
      Number(process.env.SALT_ROUNDS)
    );
    // console.log(passwordHash);
    const user = await User.insert({
      username,
      email,
      passwordHash,
    });

    return user;
  }

  static async signIn({ email, password }) {
    try {
      const user = await User.getByEmail(email);
      if (!user) throw new Error('Invalid email');
      if (!bcrypt.compareSync(password, user.passwordHash))
        throw new Error('Invalid password');
      const token = jwt.sign({ ...user }, process.env.JWT_SECRET, {
        expiresIn: '1 day',
      });

      return token;
    } catch (e) {
      e.status = 401;
      throw e;
    }
  }
};
