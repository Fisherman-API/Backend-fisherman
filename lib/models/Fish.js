const pool = require('../utils/pool');

class Fish {
  id;
  name;
  detail;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.detail = row.detail;
  }

  static async getAll() {
    const { rows } = await pool.query(
      `SELECT *  
      FROM fish;`
    );

    return rows.map((row) => new Fish(row));
  }

  static async getByID(id) {
    const { rows } = await pool.query(
      `SELECT * FROM fish
      WHERE id = $1;`,
      [id]
    );
    return new Fish(rows[0]);
  }

  static async updateById(id, attrs) {
    const fishContent = await Fish.getByID(id);
    if (!fishContent) return null;
    const newData = { ...fishContent, ...attrs };
    const { rows } = await pool.query(
      `UPDATE fish
      SET name=$2, detail=$3
      WHERE id=$1
      RETURNING *`,
      [id, newData.name, newData.detail]
    );
    if (!rows[0]) return null;

    return new Fish(rows[0]);
  }

  static async insertFish(fish) {
    const { rows } = await pool.query(
      `INSERT INTO fish (name, detail)
      VALUES ($1, $2)
      RETURNING *
      `,
      [fish.name, fish.detail]
    );
    return new Fish(rows[0]);
  }

  static async getRegulationByName(name) {
    const { rows } = await pool.query(
      `SELECT regulations.*,
              COALESCE(
                  json_agg(to_jsonb(fish))
                  FILTER (WHERE fish.name IS NOT NULL), '[]')
                  as fish FROM regulations
                  LEFT JOIN fish ON regulations.name = fish.name
                  GROUP BY regulations.id
                  ;
                  `,
      [name]
    );
    return new Fish(rows[0]);
  }

  static async getFishByName(name) {
    const { rows } = await pool.query(
      `SELECT * FROM fish
      WHERE fish.name = $1;`,
      [name]
    );

    return new Fish(rows[0]);
  }

  static async deleteById(id) {
    const { rows } = await pool.query(
      `DELETE FROM fish 
      WHERE id = $1 RETURNING *`,
      [id]
    );
    return new Fish(rows[0]);
  }
}

module.exports = { Fish };
