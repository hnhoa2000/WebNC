import db from '../utils/db.js'
import generate from './generic.model.js';
let questionModel = generate('question', 'questionId');

questionModel.findByQuizid = async function (quizId) {
    const rows = await db('question').where('quizId', quizId);

    if (rows.length === 0) {
        return null;
    }

    return rows;
}

export default questionModel;