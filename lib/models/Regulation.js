
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

  static async getByFishName(name) {
    const { rows } = await pool.query(
      
      `
      SELECT regulations.* FROM fish            
LEFT JOIN regulations ON regulations.name = fish.name
WHERE fish.name = $1
             
      `, [name]
    );
    return rows.map((row) => new Regulation(row));  
    
  }

}

module.exports = { Regulation };
