const Config = require('../config/config')
const config = new Config();
const jwt = require('jsonwebtoken');


const Pool = require('pg').Pool
const pool = new Pool({
  user: config.user,
  host: config.host,
  database: config.database,
  password: config.password,
  port: config.port,
})


const getCompany = (req, res, next) => {

  pool.query('select * from companies',
    
  (error, results) => {
    if (error) {
      throw error
    } else if(results.rowCount == 0){
      res.status(404).send({mensagem: 'nenhuma empresa encontrada'});
    } else{
      res.status(200).send(results.rows);        
       
    }
    
  }
)

    
  }

module.exports = {
  
  getCompany
  
}