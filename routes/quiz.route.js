import express from 'express';
//import { readFile } from 'fs/promises';
import quizModel from '../models/quiz.model.js';
//import validate from '../middlewares/validate.mdw.js';
import questionModel from '../models/question.model.js';
import auth from '../middlewares/auth.mdw.js';

//const schema = JSON.parse(await readFile(new URL('../schemas/quiz.json', import.meta.url)));
const router = express.Router();

router.post('/', auth, async function (req, res) {
    const quiz = {
        name: req.body.quizName,
        userId: req.payloadToken.userId,
    }
    const ret = await quizModel.add(quiz);
    const questions = req.body.questions;
    questions.map(async (question) => {
        question.quizId = ret[0];
        await questionModel.add(question);
    });
    res.status(201).json({
        message: "add quiz successly"
    });
})

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