const router = require('express').Router();
const DB = require('../src/db');
const getLimits = require('../utils/limits');


router.get("/category/:categoryId", (req, res) => {
  const { query } = req;
  DB.getCategoryProducts(
    req.params.categoryId,
    (err, result) => {
      if(err) res.send(err)
      
      res.send(result);
    },
    getLimits(query)
  );
});

router.put("/:productId/toggleFeatured", (req, res) => {
  DB.toggleFeatured(
    req.params.productId,
    (err, result) => {
      if(err) res.send(err);

      res.send(result)
    }
  )
});

module.exports = router;