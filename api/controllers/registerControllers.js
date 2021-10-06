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


const postRegister = (req, res) => {
    const { username, password } = req.body

    pool.query('select * from users where username = $1', [username], (error, results) => {
      if(error){
        throw error
      }else if(results.rowCount > 0){
        res.status(422).send({message: 'Erro! Este usuário já existe!'})
      }else{
        pool.query(
          'insert into users (username, password) values ($1, $2)',
          [username, password],
          (error1, results1) => {
            if (error1) {
              throw error1
            } else {
              pool.query('select * from users order by id_user desc limit 1', (error2, results2) => {
                if (error2) {
                  throw error2
                }else {
                  res.status(200).send({
                    message: 'Usuário cadastrado com sucesso!',
                    user: {
                      username: results2.rows[0].username,
                      activated: results2.rows[0].activated,
                      id: results2.rows[0].id_user
                    }
                  })
    
                }
                })
            } 
            
          }
        )
      }
    })
  
    
  };

module.exports = {
  
  postRegister
  
}