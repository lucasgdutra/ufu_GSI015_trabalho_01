import * as React from 'react';
import endpoints, { useQuizMutation } from '../../../../config/api';
import Modal from '../../../../components/Modal';
import { useState } from 'react';
import { useQueryClient } from '@tanstack/react-query';

interface NovaRespostaProps {
	questao: Questao;
}
const NovaResposta = ({ questao }: NovaRespostaProps) => {
	const [showModal, setShowModal] = useState(false);
	const [input, setInput] = useState('');
	const [alertMessage, setAlertMessage] = useState<string>('');
	const queryClient = useQueryClient();
	const { mutate, isLoading, isSuccess, isError, reset } = useQuizMutation<
		Resposta,
		Resposta
	>({
		endpoint: endpoints['createResposta'],
		options: {
			onSuccess: () => {
				if (questao?.questionario?.id) {
					queryClient.invalidateQueries({
						queryKey: [
							endpoints['getQuestoesByQuestionarioId'].path(
								questao.questionario?.id,
							),
						],
					});
				}
				setInput('');
				setAlertMessage('');
			},
		},
	});

	function handleOpenModal(): void {
		reset();
		setShowModal(true);
	}

	function handleCloseModal(): void {
		setShowModal(false);
	}

	function handleAddResposta(): void {
		if (input === '') {
			setAlertMessage('O titulo não pode ser vazio');
			return;
		}
		const resposta: Resposta = {
			resposta: input,
			correta: false,
			questao: questao,
		};
		mutate(resposta);
	}
	return (
		<>
			<button
				className="px-4 py-2 bg-green-500 text-white rounded"
				onClick={handleOpenModal}
			>
				Adicionar nova resposta
			</button>
			<Modal isOpen={showModal} handleClose={handleCloseModal}>
				<div className="p-8 text-center">
					<h1 className="text-2xl font-bold mb-6">
						Qual o titulo da nova resposta?
					</h1>
					{isLoading && (
						<div className="alert mt-4 px-6 py-3 rounded shadow bg-blue-500 text-center text-white">
							Criando resposta...
						</div>
					)}
					{isSuccess && (
						<div className="alert mt-4 px-6 py-3 rounded shadow bg-green-500 text-center text-white">
							Resposta criada com sucesso!
						</div>
					)}
					{isError && (
						<div className="alert mt-4 px-6 py-3 rounded shadow bg-red-500 text-center text-white">
							Erro ao criar resposta
						</div>
					)}
					<div className="flex flex-col mb-4">
						<label
							htmlFor="titulo"
							className="mb-2 font-medium text-lg"
						>
							Título
						</label>
						<input
							type="text"
							name="titulo"
							id="titulo"
							value={input}
							onChange={(event) => setInput(event.target.value)}
							className="p-2 border rounded"
						/>
					</div>
					<button
						onClick={handleAddResposta}
						className="px-4 py-2 bg-indigo-500 text-white rounded"
					>
						Adicionar
					</button>
					{alertMessage && (
						<div
							className={`alert mt-4 px-6 py-3 rounded shadow bg-red-500 text-center text-white`}
						>
							{alertMessage}
						</div>
					)}
				</div>
			</Modal>
		</>
	);
};

export { NovaResposta as NovoResposta, NovaResposta as default };
