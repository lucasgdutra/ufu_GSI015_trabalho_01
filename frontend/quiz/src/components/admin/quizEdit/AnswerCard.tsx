import { useQueryClient } from '@tanstack/react-query';
import * as React from 'react';

import { endpoints, useQuizMutation } from '../../../config/api';

interface AnswerListProps {
	answer: Resposta;
}
const AnswerList = ({ answer }: AnswerListProps) => {
	const [showAlert, setShowAlert] = React.useState<boolean>(true);
	const queryClient = useQueryClient();
	const {
		mutate,
		isLoading: isDeleting,
		isSuccess: isDeleted,
		isError: hasError,
	} = useQuizMutation<Resposta>({
		endpoint: endpoints['deleteResposta'],
		id: answer.id,
		options: {
			onMutate: () => {},
			onSuccess: () => {
				queryClient.invalidateQueries({
					queryKey: ['questoes'],
				});
			},
		},
	});

	const handleDeleteAnswer = (id: Resposta['id']) => {
		mutate(undefined);
	};
	if ((isDeleted || isDeleting || hasError) && showAlert) {
		return (
			<div
				className={`alert mb-2 p-2 rounded shadow ${
					hasError
						? 'bg-red-500'
						: isDeleted
						? 'bg-green-500'
						: 'bg-blue-500'
				}`}
			>
				<button
					className="float-right"
					onClick={() => setShowAlert(false)}
				>
					X
				</button>
				{hasError && `Erro ao deletar resposta "${answer.resposta}"`}
				{isDeleting && `Deletando resposta "${answer.resposta}"...`}
				{isDeleted && `Resposta "${answer.resposta}" deletada`}
			</div>
		);
	}
	if ((isDeleted || isDeleting || hasError) && !showAlert) {
		return null;
	}
	return (
		<div className="flex flex-col">
			<div className="flex justify-between items-center mb-2">
				<label
					className="block text-gray-700 text-sm font-bold mb-2"
					htmlFor="answer-title"
				>
					Resposta
				</label>
				<input
					id="answer-title"
					className="border p-2 rounded-md w-2/3"
					type="text"
					placeholder="Resposta"
					defaultValue={answer.resposta}
				/>
				<div className="flex items-center">
					<input
						className="mr-2"
						type="checkbox"
						defaultChecked={answer.correta}
					/>
					<button
						className="bg-red-500 text-white p-2 rounded-md"
						onClick={() => handleDeleteAnswer(answer.id)}
					>
						Deletar
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
