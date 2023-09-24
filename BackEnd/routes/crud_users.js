var express = require('express');
var router = express.Router();

var db = require("./connect.js");

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.send('respond with a resource');
});

router.post("/login", (req, res) => {
    const data = req.body;
    const query = `Select * From users Where username = '${data.username}' and password = '${data.password}' limit 1`;
    db.query(query, (err, result) => {
        if (err) throw err;
        res.send((result[0].id_user).toString());
    });
});

router.post('/login-oauth', (req, res) => {
  const data = req.body

  console.log(data)

  const q = `SELECT users.id, users.username, users.email, users.token FROM users WHERE email = '${data.email}' AND LENGTH(user.token) = 10`
  
  db.query(q, (err, result) => {
    if(err) throw err
    
    res.send(result)
  })
})


router.post("/register", (req, res) => {
    const data = req.body;
    const characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    let token = "";
    let len = 10;
    for (let i = 0; i < len; i++) {
        const j = Math.floor(Math.random() * characters.length);
        token += characters.charAt(j);
    }
    const query = `insert into users (email, username, password, token) values('${data.email}',  LOWER('${data.username}'), '${data.password}', '${token}')`;
    db.query(query, (err, result) => {
        if (err) throw err;
        res.send(result);
    });

});

router.post('/register-oauth', (req, res) => {
    const data = req.body
  
    var token = '';
    var regexp = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var len = regexp.length;
    for (var i = 0; i < 10; i++) {
        token += regexp.charAt(Math.floor(Math.random() * len));
    }

    const q = `INSERT INTO users (email, username, token)
              VALUES (LOWER('${data.email}'), LOWER('${data.username}'), '${token}')`

    db.query(q, (err, result) => {
        if (err) throw err
        res.send(result)
    })
});

// user detail params
router.get('/get-user/:id_user', (req, res) => {
    const id_user = req.params.id_user;
  const q = `select * from users where id_user = ${id_user}`
  db.query(q, (err, result) => {
    if(err) throw err
    res.send(result[0])
  })
})

//chek duplication
router.post('/register-check-username', (req, res) => {
  const data = req.body
  const q = `SELECT * FROM users u WHERE u.username LIKE '${data.username}'`

  db.query(q, (err, result) => {
    if(err) throw err

    if(result.length > 0) res.sendStatus(200)
    else res.sendStatus(404)
  })
})

router.post('/register-check-email', (req, res) => {
  const data = req.body
  const q = `SELECT * FROM users u WHERE u.email LIKE '${data.email}'`

  db.query(q, (err, result) => {
    if(err) throw err

    if(result.length > 0) res.sendStatus(200)
    else res.sendStatus(404)
  })
})


module.exports = router;