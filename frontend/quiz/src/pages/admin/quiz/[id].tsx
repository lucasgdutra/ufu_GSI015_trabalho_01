import React, { FC, useContext, useEffect } from 'react';

import { PageProps, navigate } from 'gatsby';
import { AppContext } from '../../../store/Context';
import { QuestionCard } from '../../../components/admin/quizEdit/QuestionCard';

import axios from 'axios';
import endpoints, { useQuizQuery } from '../../../config/api';

const QuizEdit: FC<PageProps> = ({ params }) => {
	const {
		state: { jogador },
	} = useContext(AppContext);

	useEffect(() => {
		if (jogador === undefined || jogador === null || jogador.name === '') {
			navigate('/login');
		}
	}, [jogador]);

	const { id } = params;

	const { data, isLoading, error } = useQuizQuery<Questionario>({
		endpoint: endpoints.getQuestionarioById,
		id: Number(id),
		useQueryOptions: {
			enabled:
				jogador !== undefined &&
				jogador !== null &&
				jogador.name !== '',
		},
	});

	const {
		data: questoesData,
		isLoading: questoesIsLoading,
		error: questoesError,
	} = useQuizQuery<Questao[]>({
		endpoint: endpoints.getQuestoesByQuestionarioId,
		id: Number(id),
		useQueryOptions: {
			enabled:
				jogador !== undefined &&
				jogador !== null &&
				jogador.name !== '',
		},
	});

	return (
		<div className="antialiased sans-serif p-4 space-y-2 flex flex-col">
			<button
				className="px-4 py-2 bg-indigo-500 text-white rounded w-1/6 max-w-xs"
				onClick={() => navigate('/admin')}
			>
				Voltar
			</button>
			{isLoading ? (
				<div>Carregando...</div>
			) : error ? (
				<div>Erro ao carregar questionário {error as string}</div>
			) : data === undefined ? (
				<div>Nenhum questionário disponivel</div>
			) : (
				<div className="mt-4 p-4 border rounded-md bg-white">
					<h1 className="text-xl">{data.titulo}</h1>
				</div>
			)}
			<button className="px-4 py-2 bg-green-500 text-white rounded">
				Adicionar nova questão
			</button>

			{questoesIsLoading ? (
				<div>Carregando...</div>
			) : questoesError ? (
				<div>Erro ao carregar questões {questoesError as string} </div>
			) : questoesData === undefined || questoesData.length === 0 ? (
				<div>Nenhuma questão disponivel</div>
			) : (
				questoesData.map((question, index) => (
					<QuestionCard key={index} questao={question} />
				))
			)}
		</div>
	);
};

export default QuizEdit;
