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


const postUser = (req, res) => {
    const { username, password } = req.body
  
    pool.query(
      'select id_user, username, password, activated from users where username = $1 and password = $2',
      [username, password],
      (error, results) => {
        if (error) {
          throw error
        } else if(results.rowCount == 0){
          res.status(404).send({mensagem: 'Acesso Negado'});
        } else{
            
            let token = jwt.sign({
              id: results.rows[0].id_user,
              username: username
            }, 
            config.jwt_key,
            {
              expiresIn: "30m"
            })
            res.status(200).send({
              username: results.rows[0].username,
              mensagem: 'Autenticado com sucesso',
              token: token,

            })
        }
        
      }
    )
  }

module.exports = {
  
  postUser
  
}