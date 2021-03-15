const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT;

app.use(cors());

app.use('/', require('./routes'));

app.listen(port, () => {
  console.log(`http://localhost:${port}`)
})