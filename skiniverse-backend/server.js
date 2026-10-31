const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middleware
app.use(express.json());
app.use(cors());
s
// Route uji coba
app.get('/', (req, res) => {
    res.json({ message: "Selamat datang di API Backend SkiniVerse!" });
});

// Jalankan Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Backend SkiniVerse berjalan di port ${PORT}`);
});