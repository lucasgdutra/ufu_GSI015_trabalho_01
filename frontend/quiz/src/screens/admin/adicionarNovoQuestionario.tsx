import * as React from 'react';
import endpoints, { useQuizMutation } from '../../config/api';
import Modal from '../../components/Modal';
import { useState } from 'react';
import { navigate } from 'gatsby';
import { useQueryClient } from '@tanstack/react-query';

const NovoQuestionario = () => {
	const [showModal, setShowModal] = useState(false);
	const [input, setInput] = useState('');
	const [alertMessage, setAlertMessage] = useState<string>('');
	const queryClient = useQueryClient();
	const { mutate, isLoading, isSuccess, isError, reset } = useQuizMutation<
		Questionario,
		Questionario
	>({
		endpoint: endpoints['createQuestionario'],
	});

	function handleOpenModal(): void {
		reset();
		setShowModal(true);
	}

	function handleCloseModal(): void {
		setShowModal(false);
	}

	function handleAddQuestionario(): void {
		if (input === '') {
			setAlertMessage('O titulo não pode ser vazio');
			return;
		}
		const questionario: Questionario = {
			titulo: input,
			questoes: [],
		};
		mutate(questionario, {
			onSuccess: (data) => {
				queryClient.invalidateQueries({
					queryKey: [endpoints['getQuestionarios'].path()],
				});
				navigate(`/admin/quiz/${data.data.id}`);
			},
		});
	}
	return (
		<>
			<button
				className="px-4 py-2 bg-green-500 text-white rounded"
				onClick={handleOpenModal}
			>
				Adicionar novo questionário
			</button>
			<Modal isOpen={showModal} handleClose={handleCloseModal}>
				<div className="p-8 text-center">
					<h1 className="text-2xl font-bold mb-6">
						Qual o titulo do novo questionário?
					</h1>
					{isLoading && (
						<div className="alert mt-4 px-6 py-3 rounded shadow bg-blue-500 text-center text-white">
							Criando questionário...
						</div>
					)}
					{isSuccess && (
						<div className="alert mt-4 px-6 py-3 rounded shadow bg-green-500 text-center text-white">
							Questionário criado com sucesso!
						</div>
					)}
					{isError && (
						<div className="alert mt-4 px-6 py-3 rounded shadow bg-red-500 text-center text-white">
							Erro ao criar questionário
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
						onClick={handleAddQuestionario}
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

export { NovoQuestionario, NovoQuestionario as default };
