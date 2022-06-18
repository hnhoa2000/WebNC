import db from '../utils/db.js'
import generate from './generic.model.js';
let quizModel = generate('quiz', 'quizId');

quizModel.findByName = async function (nameQuiz) {
    const rows = await db('quiz').where('name', nameQuiz);

    if (rows.length === 0) {
        return null;
    }

    return rows[0];
}

export default quizModel;