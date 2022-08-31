
const pool = require('../utils/pool');


module.exports = class Regulation {
  id;
  name;
  detail;

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

  static async updateById(id, attrs) {
    const update = await Regulation.getById(id);
    if (!update) return null;
    const updatedRegulation = { ...update, ...attrs };
    const { rows } = await pool.query(`
    UPDATE regulations SET detail = $2, name = $3 
    WHERE id = $1 RETURNING *`, 
    [id, updatedRegulation.detail, updatedRegulation.name]
    );
    if (!rows[0]) return null;

    return new Regulation(rows[0]);
  }
};



