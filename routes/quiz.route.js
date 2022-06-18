import express from 'express';
//import { readFile } from 'fs/promises';
import quizModel from '../models/quiz.model.js';
//import validate from '../middlewares/validate.mdw.js';
import questionModel from '../models/question.model.js';

//const schema = JSON.parse(await readFile(new URL('../schemas/quiz.json', import.meta.url)));
const router = express.Router();

router.get('/:nameQuiz', async function (req, res) {

    const quiz = await quizModel.findByName(req.params.nameQuiz);
    const listQuestion = await questionModel.findByQuizid(quiz.quizId);
    for (let i = 0; i < listQuestion.length; i++) {
        delete listQuestion[i].questionId;
        delete listQuestion[i].quizId;
        delete listQuestion[i].lastUpdate;
    }
    const result = {
        name: quiz.name,
        questions: listQuestion
    }
    res.status(201).json(result);
})

export default router;