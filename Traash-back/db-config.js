
const sqlite3 = require('sqlite3').verbose();

let db = new sqlite3.Database('./database/traash.db', sqlite3.OPEN_READWRITE, (err) => {
    if (err) {
      console.error(err.message);
      // throw new Error('database failed to connect');
    }
    console.log('[db] connected to the traash database.');
});

module.exports = db;
