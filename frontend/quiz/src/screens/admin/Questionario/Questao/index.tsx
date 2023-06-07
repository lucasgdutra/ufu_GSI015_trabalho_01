import { useMutation, useQueryClient } from '@tanstack/react-query';
import * as React from 'react';
import AnswerCard from './Resposta';

import { endpoints, useQuizMutation } from '../../../../config/api';
import { Alert } from '../../../../components/Alert';
import CriarNovaResposta from './adicionarNovaResposta';

interface QuestionCardProps {
	questao: Questao;
}
const QuestionCard = ({ questao }: QuestionCardProps) => {
	const queryClient = useQueryClient();
	const [pergunta, setPergunta] = React.useState<Questao['pergunta']>(
		questao.pergunta,
	);
	const [pontuacao, setPontuacao] = React.useState<Questao['pontuacao']>(
		questao.pontuacao,
	);
	const {
		mutate: deleteMutation,
		isLoading: isDeleting,
		isSuccess: isDeleted,
		isError: hasDeleteError,
	} = useQuizMutation<Questao>({
		endpoint: endpoints['deleteQuestao'],
		id: questao.id,
		options: {
			onMutate: () => {},
			onSuccess: () => {
				if (questao?.questionario?.id) {
					queryClient.invalidateQueries({
						queryKey: [
							endpoints['getQuestoesByQuestionarioId'].path(
								questao?.questionario?.id,
							),
						],
					});
				}
			},
		},
	});

	const handleDelete = () => {
		deleteMutation(undefined);
	};
	const { mutate: updateMutate } = useQuizMutation<Questao, Questao>({
		endpoint: endpoints['updateQuestao'],
		id: questao.id,
		options: {
			onMutate: () => {},
			onSuccess: () => {
				if (questao?.questionario?.id) {
					queryClient.invalidateQueries({
						queryKey: [
							endpoints['getQuestoesByQuestionarioId'].path(
								questao?.questionario?.id,
							),
						],
					});
				}
			},
		},
	});

	const handleUpdate = () => {
		updateMutate({
			pergunta: pergunta,
			pontuacao: pontuacao,
		});
	};
	if (isDeleting) {
		return (
			<Alert type="info">Deletando questão "{questao.pergunta}"</Alert>
		);
	}
	if (isDeleted) {
		return (
			<Alert type="white">Deletada questão "{questao.pergunta}"</Alert>
		);
	}
	if (hasDeleteError) {
		return (
			<Alert type="error">
				Erro ao deletar questão "{questao.pergunta}"
			</Alert>
		);
	}
	return (
		<div className="mt-4 p-4 border rounded-md bg-white shadow-lg">
			<div className="flex flex-col justify-center items-center mb-4 space-y-2">
				<div className="w-full">
					<label className="mr-2">Pergunta</label>
					<input
						className="border p-2 rounded-md w-full"
						type="text"
						placeholder="Titulo Questão"
						defaultValue={pergunta}
						onChange={(e) => {
							setPergunta(e.target.value);
						}}
					/>
				</div>
				<div className="w-full flex justify-center  items-end space-x-4">
					<div className="w-1/2">
						<label className="mr-2">Pontuação</label>
						<input
							className="border p-2 rounded-md w-full"
							type="number"
							placeholder="Point Value"
							defaultValue={pontuacao}
							onChange={(e) => {
								setPontuacao(parseInt(e.target.value));
							}}
						/>
					</div>
					<div className="w-1/2 flex space-x-4">
						<button
							className="bg-blue-500 text-white p-2 rounded-md w-1/2"
							onClick={handleUpdate}
						>
							Atualizar
						</button>
						<button
							className="bg-red-500 text-white p-2 rounded-md w-1/2 "
							onClick={() => handleDelete()}
						>
							Deletar
						</button>
					</div>
				</div>
			</div>
			<CriarNovaResposta questao={questao} />
			{questao.respostas && (
				<table className="table-auto w-full  min-w-full divide-y divide-gray-200">
					<thead className="bg-gray-50">
						<tr>
							<th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Resposta
							</th>
							<th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Correta
							</th>
							<th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Ações
							</th>
						</tr>
					</thead>
					<tbody className="bg-white divide-y divide-gray-200">
						{questao?.respostas.map((resposta) => (
							<AnswerCard key={resposta.id} answer={resposta} />
						))}
					</tbody>
				</table>
			)}
		</div>
	);
};

export { QuestionCard, QuestionCardProps, QuestionCard as default };
