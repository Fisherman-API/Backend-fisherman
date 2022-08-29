const pool = require('../utils/pool');


class Regulation {
  id;
  name;
  region;
  rules;
  seasons;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.region = row.region;
    this.rules = row.rules;
    this.seasons = row.seasons;
  }

  static async getById() {
    const { rows } = await pool.query(
      
      `SELECT regulations.*,
            COALESCE(
                json_agg(to_jsonb(fish))
                FILTER (WHERE fish.name IS NOT NULL), '[]')
                as fish FROM regulations
                LEFT JOIN fish ON regulations.name = fish.name
                GROUP BY fish.id
                ;
                `
    );
    return rows.map((row) => new Regulation(row));  
    
  }

}

module.exports = { Regulation };
