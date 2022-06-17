import express from 'express';
import morgan from 'morgan';
import userRouter from './routes/user.route.js'
import authRouter from './routes/auth.route.js'

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(morgan('dev'));

app.use('/api/users', userRouter);
app.use('/api/auth', authRouter);

app.get('/', function (req, res) {
    res.send('hello world');
});

app.get('/err', function (req, res) {
    throw new Error('Error!');
})

app.use(function (req, res) {
    res.status(404).json({
        error: 'Endpoint not found.'
    });
});

app.use(function (err, req, res, next) {
    console.log(err.stack);
    res.status(500).json({
        error: 'Something wrong!'
    });
});

app.listen(PORT, function () {
    console.log(`App is listening at http://localhost:${PORT}`);
});