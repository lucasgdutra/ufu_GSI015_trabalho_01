// src/pages/quiz/[id].js

import React, { FC, useContext, useEffect, useState } from 'react';

import { PageProps, navigate } from 'gatsby';
import { ActionTypes, AppContext } from '../../store/Context';
import endpoints, { useQuizQuery } from '../../config/api';
import axios from 'axios';

interface QuestionCardProps {
	question: Questao;
	index: number;
	total: number;
	onCorrectAnswer: (points: number) => void;
}

const QuestionCard: React.FC<QuestionCardProps> = ({
	question,
	index,
	total,
	onCorrectAnswer,
}) => {
	const [selectedAnswer, setSelectedAnswer] = useState<Resposta | null>(null);
	const [alertMessage, setAlertMessage] = useState<string | null>(null);
	const [isAnswerChecked, setIsAnswerChecked] = useState<boolean>(false);

	const handleVerifyAnswer = () => {
		if (!selectedAnswer || isAnswerChecked) return;

		(async () => {
			setAlertMessage('Verificando resposta...');
			const isCorrect: boolean = await fetch(
				`/api/respostas/${selectedAnswer.id}/correta`,
			).then((res) => res.json());
			if (isCorrect) {
				setAlertMessage('Resposta correta');
				onCorrectAnswer(question.pontuacao);
			} else {
				setAlertMessage('Resposta errada');
			}
			setIsAnswerChecked(true);
		})();
	};

	return (
		<div className="card bg-white shadow-lg rounded-lg p-6 mb-4 relative">
			<div className="absolute top-2 right-2 text-gray-500">
				{index + 1} / {total}
			</div>
			<h2 className="text-xl font-bold mb-4">{question.pergunta}</h2>
			{question.respostas?.map((answer) => (
				<div key={answer.id} className="flex items-center mb-2">
					<input
						type="radio"
						id={`answer-${answer.id}`}
						name={`question-${question.id}`}
						value={answer.id}
						onChange={() => setSelectedAnswer(answer)}
						className="mr-2"
						disabled={isAnswerChecked}
					/>
					<label
						htmlFor={`answer-${answer.id}`}
						className={` ${
							isAnswerChecked && answer.correta
								? 'text-green-500'
								: isAnswerChecked && !answer.correta
								? 'text-red-500'
								: 'text-gray-700'
						}`}
					>
						{answer.resposta}
					</label>
				</div>
			))}
			<button
				onClick={handleVerifyAnswer}
				className="bg-indigo-500 text-white active:bg-indigo-600 disabled:bg-indigo-400 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
				disabled={isAnswerChecked}
			>
				Verificar resposta
			</button>
			{alertMessage && (
				<div
					className={`alert mt-4 px-6 py-3 rounded shadow font-bold ${
						alertMessage === 'Resposta correta'
							? 'text-green-500'
							: alertMessage === 'Verificando resposta...'
							? 'text-blue-500'
							: 'text-red-500'
					}`}
				>
					{alertMessage}
				</div>
			)}
		</div>
	);
};

const QuizPage: FC<PageProps> = ({ params }) => {
	const {
		state: { jogador, jogo },
		dispatch,
	} = useContext(AppContext);
	useEffect(() => {
		if (jogador === undefined || jogador === null || jogador.name === '') {
			navigate('/login');
		}
	}, [jogador]);

	const { id } = params;

	const { data, isLoading, error } = useQuizQuery<Questao[]>({
		endpoint: endpoints.getQuestoesByQuestionarioId,
		id: Number(id),
		useQueryOptions: {
			enabled:
				jogador !== undefined &&
				jogador !== null &&
				jogador.name !== '',
		},
	});

	const [totalPoints, setTotalPoints] = useState<number>(0);

	useEffect(() => {}, [totalPoints]);

	const handleGoBack = () => {
		navigate('/jogar');
	};

	const handleCorrectAnswer = (points: number) => {
		setTotalPoints(totalPoints + points);
		if (jogo !== undefined && jogo !== null) {
			dispatch({
				type: ActionTypes.SET_JOGO,
				payload: { ...jogo, pontuacao: (jogo.pontuacao || 0) + points },
			});
		}
		if (jogador !== undefined && jogador !== null) {
			dispatch({
				type: ActionTypes.SET_JOGADOR,
				payload: {
					...jogador,
					pontuacao: (jogador.pontuacao || 0) + points,
				},
			});
		}
	};

	if (isLoading) return <p>Carregando...</p>;
	if (error) return <p>Erro {error as string}</p>;
	if (data === undefined) return <div>Nenhum questionário disponivel</div>;

	return (
		<div className="p-4 space-y-2">
			<div className="flex justify-between">
				<button
					onClick={handleGoBack}
					className="bg-indigo-500 text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
				>
					Voltar
				</button>
				<p className="text-xl text-gray-500">
					Pontuação total: {totalPoints}
				</p>
			</div>
			{data.map((questao: Questao, index: number) => (
				<QuestionCard
					key={questao.id}
					index={index}
					total={data.length}
					question={questao}
					onCorrectAnswer={handleCorrectAnswer}
				/>
			))}
		</div>
	);
};

export default QuizPage;
