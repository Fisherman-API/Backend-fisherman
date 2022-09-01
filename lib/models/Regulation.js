
const pool = require('../utils/pool');


module.exports = class Regulation {
  id;
  name;
  detail;
  details;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.detail = row.detail;
    this.details = row.details;
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
    UPDATE regulations SET details = $2, name = $3 
    WHERE id = $1 RETURNING *`, 
    [id, updatedRegulation.details, updatedRegulation.name]
    );
    if (!rows[0]) return null;

    return new Regulation(rows[0]);
  }
  


  static async getFishRegDetail(id) {
    const { rows } = await pool.query(`
    SELECT regulations.details, fish.*
 FROM regulations
 LEFT JOIN fish_regulations ON fish_regulations.fish_id = regulations.id
 LEFT JOIN fish ON fish.id = fish_regulations.regulations_id
 WHERE fish.id = $1
 GROUP BY fish.id, regulations.details
    `, [id]);
    if (!rows[0]) return null;
    return new Regulation(rows[0]);
  }
};



