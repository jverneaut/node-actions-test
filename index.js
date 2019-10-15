const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.json({
    hello: 'world',
    description: 'GitHub actions c\'est vraiment très très bien.'
  });
});

app.get('/app', (req, res) => {
  res.json({
    description: 'Ceci est une route.'
  });
});

app.listen(80);
