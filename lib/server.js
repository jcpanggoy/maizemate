const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 5000;
const User = require('./User'); // Adjust the path as necessary based on your project structure

app.use(express.json()); // This is correct and ensures JSON bodies are parsed
app.use(cors()); // Enables CORS

// Connect to MongoDB
mongoose.connect('mongodb+srv://jcpanggoyyy23:1023@maizemate.wasrgis.mongodb.net/', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('MongoDB Connected'))
  .catch(err => console.log(err));

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

// Route to get all users
app.get('/api/users', async (req, res) => {
    try {
      const users = await User.find({});
      res.json(users);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
});

app.post('/api/users', async (req, res) => {
    try {
        const user = new User({
            name: req.body.name,
            phoneNumber: req.body.phoneNumber,
            username: req.body.username,
            password: req.body.password,
        });
        const newUser = await user.save();
        res.status(201).json(newUser);
    } catch (err) {
        console.error(err);
        res.status(400).json({ message: err.message });
    }
});

