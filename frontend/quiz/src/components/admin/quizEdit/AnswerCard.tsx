import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';
import * as React from 'react';
import { startTransition, useState } from 'react';

const deleteAnswer = async (id: Resposta['id']) => {
	const res = await axios.delete(`/api/respostas/${id}`);
	if (res.status !== 200) {
		throw new Error('Erro ao deletar resposta');
	}
};

interface AnswerListProps {
	answer: Resposta;
}
const AnswerList = ({ answer }: AnswerListProps) => {
	const { data, isLoading, error } = useQuery<Resposta['correta']>({
		queryKey: [`resposta_${answer.id}_correta`],
		queryFn: () =>
			axios
				.get(`/api/respostas/${answer.id}/correta`)
				.then((res) => res.data),
	});
	const [alertMessage, setAlertMessage] = useState<string>('');
	const queryClient = useQueryClient();
	const mutation = useMutation(deleteAnswer, {
		onSuccess: () => {
			queryClient.invalidateQueries([
				'questionarios',
				'questoes',
				'respostas',
			]);
			startTransition(() => {
				setAlertMessage('Resposta deletada com sucesso');
				setTimeout(() => {
					setAlertMessage('');
				}, 5000);
			});
		},
	});

	const handleDeleteAnswer = (id: Resposta['id']) => {
		startTransition(() => {
			setAlertMessage('Deletando resposta de ID: ' + id + '...');
			mutation.mutate(id);
		});
	};
	return (
		<div className="flex flex-col">
			{alertMessage && (
				<div
					className={
						'alert mt-4 px-6 py-3 rounded shadow bg-blue-500'
					}
				>
					{alertMessage}
				</div>
			)}

			<div className="flex justify-between items-center mb-2">
				<label
					className="block text-gray-700 text-sm font-bold mb-2"
					htmlFor="answer-title"
				>
					Answer Title:
				</label>
				<input
					id="answer-title"
					className="border p-2 rounded-md w-2/3"
					type="text"
					placeholder="Answer Title"
					defaultValue={answer.resposta}
				/>
				<div className="flex items-center">
					{isLoading ? (
						<div>Carregando...</div>
					) : error ? (
						<div>Erro ao carregar resposta correta</div>
					) : (
						<input
							className="mr-2"
							type="checkbox"
							defaultChecked={data}
						/>
					)}
					<button
						className="bg-red-500 text-white p-2 rounded-md"
						onClick={() => handleDeleteAnswer(answer.id)}
					>
						Delete
					</button>
				</div>
			</div>
		</div>
	);
};

export {
	AnswerList as AnswerCard,
	AnswerListProps as AnswerCardProps,
	AnswerList as default,
};
