var express = require('express');
var router = express.Router();

var db = require("./connect.js");

router.post('/create', (req, res) => {
    const data = req.body;
    const query = `Insert Into fishes (user_id, fish_type_id, name, description, price, image_path) values
    ('${data.user_id}', '${data.fish_type_id}', '${data.name}', '${data.description}', '${data.price}', '${data.image_path}')`;
    db.query(query, (err, result) => {
        if (err) throw err;
        res.send(result);
    });
});

router.post('/edit', (req, res) => {
    const data = req.body;
    const query = `Update fishes Set fish_type_id = '${data.fish_type_id}', description = '${data.description}', price = '${data.price}', image_path = '${data.image_path}' 
    where user_id = '${data.user_id}' and id = '${data.id}'`;
    db.query(query, (err, result) => {
        if (err) throw err;
        res.send(result);
    })
});

// create fish
router.post('/createfish', upload.single('image'), (req, res) => {
    const data = req.body
    const file = req.file

    const filePath = `${file.path.replace('\\', '/')}`

    const q = `Insert Into fishes (user_id, fish_type_id, fish_name, description, price, image_path) 
                values (${data.userID}, ${data.fishType}, '${data.name}', '${data.desc}', ${data.price}, '${filePath}')`
    
    db.query(q, (err, result) => {
        if(err) throw err
        res.send(result)
    })

    // res.json(file.path)
})

module.exports = router;