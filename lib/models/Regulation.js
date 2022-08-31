
const pool = require('../utils/pool');


module.exports = class Regulation {
  id;
  name;
  details;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.detail = row.detail;
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * FROM regulations');
    return rows.map((row) => new Regulation(row));
  }

  static async getById(id) {
    const { rows } = await pool.query('SELECT * FROM regulations WHERE id = $1', [
      id,
    ]);
    if (!rows[0]) return null;
    return new Regulation(rows[0]);
  }

};

