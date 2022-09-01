const pool = require('../utils/pool');

module. exports = class User {
  id;
  username;
  #passwordHash;
  email;

  constructor(row) {
    this.id = row.id;
    this.username = row.username;
    this.#passwordHash = row.password_hash;
    this.email = row.email;
    
  }

  static async insert({
    username,
    passwordHash,
    email,
  }) {
    const { rows } = await pool.query(`
      INSERT INTO users
      (username, password_hash, email)
      VALUES ($1, $2, $3)
      RETURNING *`, [username, passwordHash, email]);
  
    return new User(rows[0]);
  }

  static async getByEmail(email) {
    const { rows } = await pool.query(
      `SELECT * FROM users 
      WHERE email = $1`, [email]
    ); 
    if (!rows[0]) return null;
    return new User(rows[0]);
  }

  get passwordHash() {
    return this.#passwordHash;
  }
};





