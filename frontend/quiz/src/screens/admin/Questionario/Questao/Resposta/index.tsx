import { useQueryClient } from '@tanstack/react-query';
import * as React from 'react';

import { endpoints, useQuizMutation } from '../../../../../config/api';
import { Alert } from '../../../../../components/Alert';

interface AnswerListProps {
	answer: Resposta;
}

const AnswerList = ({ answer }: AnswerListProps) => {
	const [resposta, setResposta] = React.useState<string | undefined>(
		answer.resposta,
	);
	const [correta, setCorreta] = React.useState<boolean | undefined>(
		answer.correta,
	);
	const queryClient = useQueryClient();
	const {
		mutate: deleteMutate,
		isLoading: isDeleting,
		isSuccess: isDeleted,
		isError: hasError,
	} = useQuizMutation<Resposta>({
		endpoint: endpoints['deleteResposta'],
		id: answer.id,
		options: {
			onMutate: () => {},
			onSuccess: () => {
				if (answer.questao?.questionario?.id) {
					queryClient.invalidateQueries({
						queryKey: [
							endpoints['getQuestoesByQuestionarioId'].path(
								answer.questao?.questionario?.id,
							),
						],
					});
				}
			},
		},
	});

	const { mutate: updateMutate } = useQuizMutation<Resposta, Resposta>({
		endpoint: endpoints['updateResposta'],
		id: answer.id,
		options: {
			onMutate: () => {},
			onSuccess: () => {
				if (answer.questao?.questionario?.id) {
					queryClient.invalidateQueries({
						queryKey: [
							endpoints['getQuestoesByQuestionarioId'].path(
								answer.questao?.questionario?.id,
							),
						],
					});
				}
			},
		},
	});

	const handleDelete = (id: Resposta['id']) => {
		deleteMutate(undefined);
	};

	const handleUpdate = () => {
		updateMutate({
			resposta: resposta || '',
			correta: correta || false,
		});
	};

	if (isDeleted || isDeleting || hasError) {
		return (
			<tr>
				<td className="border px-4 py-2 whitespace-nowrap" colSpan={3}>
					<Alert
						type={
							hasError ? 'error' : isDeleted ? 'success' : 'info'
						}
					>
						{hasError && `Erro ao deletar resposta "${resposta}"`}
						{isDeleting && `Deletando resposta "${resposta}"...`}
						{isDeleted && `Resposta "${resposta}" deletada`}
					</Alert>
				</td>
			</tr>
		);
	}

	return (
		<tr>
			<td className="border px-4 py-2 whitespace-nowrap">
				<input
					type="text"
					value={resposta}
					onChange={(e) => setResposta(e.target.value)}
				/>
			</td>
			<td className="border px-4 py-2 whitespace-nowrap">
				<input
					type="checkbox"
					checked={correta}
					onChange={() => setCorreta(!correta)}
				/>
			</td>
			<td className="border px-4 py-2 whitespace-nowrap">
				<div className="flex space-x-4">
					<button
						className="bg-blue-500 text-white p-2 rounded-md w-1/2"
						onClick={handleUpdate}
					>
						Atualizar
					</button>
					<button
						className="bg-red-500 text-white p-2 rounded-md w-1/2"
						onClick={() => handleDelete(answer.id)}
					>
						Deletar
					</button>
				</div>
			</td>
		</tr>
	);
};

export {
	AnswerList as AnswerCard,
	AnswerListProps as AnswerCardProps,
	AnswerList as default,
};
