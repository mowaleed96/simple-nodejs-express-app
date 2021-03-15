const _ = require('lodash');
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

const getCategoryTree = (categoryId, cb) => {
  const sql = 
  'WITH RECURSIVE recursiveTable (id, parent_id)' +
  'AS' +
  '(' +
  '    SELECT  cat.id,' +
  '            cat.parent_id' +
  '    FROM categories AS cat' +
  `    WHERE id = ${categoryId}` +
  '    UNION ALL' +
  '    SELECT  cat.id,' +
  '            cat.parent_id' +
  '    FROM categories AS cat' +
  '        INNER JOIN recursiveTable rt ON' +
  '        cat.parent_id = rt.id AND cat.id != cat.parent_id' +
  ')' +
  'SELECT id ' +
  'FROM recursiveTable;'; 

  _executeQuery(sql, cb);
}

const getCategoryProducts  = (categoryId, cb, limit) => {
  getCategoryTree(categoryId, (err, treeResult) => {
    if(err) {
      cb(err,null);
      return;
    }
    const catIds = treeResult.map(result => result.id);
    const sql = 
    'select prod.id prodId, prod.name prodName, prod.image_uri, pp.price ' +
    'from products prod ' +
	  '   INNER JOIN (' +
		'   SELECT product_id id, MIN(price) price' +
		'   FROM product_providers ' +
    '     where available is true ' +
    '     group by id ' +
	  '   ) pp ' +
    '   ON prod.id = pp.id ' +
    `where prod.category_id in (${catIds}) `;

    _executeQuery(sql, cb, limit);
  })
}

const toggleFeatured = (productId, cb) => {
  _executeQuery(
    `UPDATE products 
      SET featured = !featured
      where id = ${productId};`
    ,
    cb,
  );
}

const _executeQuery = (sql, cb, limit = null) => {
  if(!_.isNil(limit)) sql += ` LIMIT ${limit.skip}, ${limit.size}`;
  connection.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      
      return cb(err, null);
    } else {
      return cb(null, result);
    }
  });
}

module.exports = {
  getCategoryTree,
  getCategoryProducts,
  toggleFeatured,
};