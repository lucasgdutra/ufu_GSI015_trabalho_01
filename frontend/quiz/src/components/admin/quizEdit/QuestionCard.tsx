import { useMutation, useQueryClient } from '@tanstack/react-query';
import * as React from 'react';
import { startTransition, useState } from 'react';
import AnswerCard from './AnswerCard';
import axios from 'axios';

const deleteQuestion = async (id: Questao['id']) => {
	const res = await axios.delete(`/api/questoes/${id}`);
	if (res.status !== 200) {
		throw new Error('Erro ao deletar questao');
	}
};

interface QuestionCardProps {
	questao: Questao;
}
const QuestionCard = ({ questao }: QuestionCardProps) => {
	const [alertMessage, setAlertMessage] = useState<string>('');
	const queryClient = useQueryClient();
	const mutation = useMutation(deleteQuestion, {
		onSuccess: () => {
			queryClient.invalidateQueries(['questoes']);
			startTransition(() => {
				setAlertMessage('Questão deletada com sucesso');
				setTimeout(() => {
					setAlertMessage('');
				}, 5000);
			});
		},
	});

	const handleDeleteQuestion = (id: Questionario['id']) => {
		startTransition(() => {
			setAlertMessage('Deletando questão de ID: ' + id + '...');
		});
		mutation.mutate(id);
	};
	return (
		<div className="mt-4 p-4 border rounded-md bg-white">
			{alertMessage && (
				<div
					className={
						'alert mt-4 px-6 py-3 rounded shadow bg-blue-500'
					}
				>
					{alertMessage}
				</div>
			)}
			<div className="flex flex-col justify-between items-center mb-4">
				<div className="w-full">
					<label className="mr-2">Pergunta</label>
					<input
						className="border p-2 rounded-md w-full"
						type="text"
						placeholder="Question Title"
						defaultValue={questao.pergunta}
					/>
				</div>
				<div>
					<label className="mr-2">Pontuação</label>
					<input
						className="border p-2 rounded-md mr-2"
						type="number"
						placeholder="Point Value"
						defaultValue={questao.pontuacao}
					/>
				</div>
				<button
					className="bg-red-500 text-white p-2 rounded-md"
					onClick={() => handleDeleteQuestion(questao.id)}
				>
					Delete
				</button>
			</div>
			{questao.respostas &&
				questao?.respostas.map((resposta, j) => (
					<AnswerCard key={j} answer={resposta} />
				))}
		</div>
	);
};

export { QuestionCard, QuestionCardProps, QuestionCard as default };
