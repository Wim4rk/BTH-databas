// Imports
const express = require('express');
const expressLayouts = require('express-ejs-layouts');

const app = express();
const port = 1337;

// Static files
app.use(express.static('public'));
app.use('/css', express.static(__dirname + 'public/css'));
// app.use('/js', express.static(__dirname + 'public/js'));
// app.use('/img', express.static(__dirname + 'public/img'));

// Set templating engine
app.use(expressLayouts);
app.set('view engine', 'ejs');

// Navigation
app.get('', (req, res) => {
  res.render("index");
});

// Listen on port 1337
app.listen(port, () => console.info(`App listening on port ${port}`));
