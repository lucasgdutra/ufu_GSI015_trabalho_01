import React, { FC, useContext, useEffect } from 'react';

import { PageProps, navigate } from 'gatsby';
import { AppContext } from '../../../store/Context';
import { QuestionCard as Questao } from './Questao';

import endpoints, { useQuizMutation, useQuizQuery } from '../../../config/api';
import CriarNovaQuestao from './adicionarNovaQuestao';
import { useQueryClient } from '@tanstack/react-query';
import Alert from '../../../components/Alert';

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
	const [questionarioTitulo, setQuestionarioTitulo] =
		React.useState<Questionario['titulo']>();

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

	useEffect(() => {
		setQuestionarioTitulo(data?.titulo);
	}, [data?.titulo]);

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
	const queryClient = useQueryClient();
	const {
		mutate: deleteMutate,
		isLoading: isDeleting,
		isSuccess: isDeleted,
		isError: hasError,
		reset: resetDelete,
	} = useQuizMutation<Questionario>({
		endpoint: endpoints['deleteQuestionario'],
		id: Number(id),
		options: {
			onMutate: () => {},
			onSuccess: () => {
				queryClient.invalidateQueries({
					queryKey: [
						endpoints['getQuestionarios'].path(),
						endpoints['getQuestoesByQuestionarioId'].path(
							Number(id),
						),
						endpoints['getQuestoesByQuestionarioId'].path(
							Number(id),
						),
					],
				});
				navigate('/admin');
			},
		},
	});
	const handleDelete = () => {
		resetDelete();
		resetUpdate();
		deleteMutate(undefined);
	};

	const {
		mutate: updateMutate,
		isLoading: isUpdating,
		isSuccess: isUpdated,
		isError: hasUpdateError,
		reset: resetUpdate,
	} = useQuizMutation<Questionario, Questionario>({
		endpoint: endpoints['updateQuestionario'],
		id: Number(id),
		options: {
			onMutate: () => {},
			onSuccess: () => {
				queryClient.invalidateQueries({
					queryKey: [
						endpoints['getQuestionarios'].path(),
						endpoints['getQuestoesByQuestionarioId'].path(
							Number(id),
						),
						endpoints['getQuestoesByQuestionarioId'].path(
							Number(id),
						),
					],
				});
			},
		},
	});

	const handleUpdate = () => {
		resetDelete();
		resetUpdate();
		updateMutate({
			titulo: questionarioTitulo,
		});
	};

	return (
		<div className="antialiased sans-serif p-4 space-y-2 flex flex-col w-full">
			<button
				className="px-4 py-2 bg-indigo-500 text-white rounded w-1/6 max-w-xs"
				onClick={() => navigate('/admin')}
			>
				Voltar
			</button>
			{isLoading ? (
				<div>Carregando...</div>
			) : error ? (
				<div>
					<p>Erro ao carregar questionário</p>
					<p> {error.response?.data.message}</p>
				</div>
			) : data === undefined ? (
				<div>Nenhum questionário disponivel</div>
			) : (
				<div className="mt-4 p-4 border rounded-md bg-white w-full">
					{(isUpdating ||
						isDeleting ||
						isDeleted ||
						isUpdated ||
						hasError ||
						hasUpdateError) && (
						<Alert
							type={
								isDeleting || isUpdating
									? 'info'
									: isDeleted || isUpdated
									? 'success'
									: hasError || hasUpdateError
									? 'error'
									: 'white'
							}
						>
							{isDeleting && 'Deletando...'}
							{isUpdating && 'Atualizando...'}
							{isDeleted && 'Deletado com sucesso'}
							{isUpdated && 'Atualizado com sucesso'}
							{hasError && 'Erro ao deletar'}
							{hasUpdateError && 'Erro ao atualizar'}
						</Alert>
					)}
					<input
						className="text-xl w-full"
						type="text"
						value={questionarioTitulo}
						onChange={(e) => setQuestionarioTitulo(e.target.value)}
					/>
					<div className="flex space-x-4 w-full">
						<button
							className="bg-blue-500 text-white p-2 rounded-md w-1/2"
							onClick={() => handleUpdate()}
						>
							Atualizar
						</button>
						<button
							className="bg-red-500 text-white p-2 rounded-md w-1/2"
							onClick={() => handleDelete()}
						>
							Deletar
						</button>
					</div>
				</div>
			)}
			<CriarNovaQuestao questionarioId={Number(id)} />

			{questoesIsLoading ? (
				<div>Carregando...</div>
			) : questoesError ? (
				<div>
					<p>Erro ao carregar questões</p>
					<p>{questoesError.response?.data.message}</p>
				</div>
			) : questoesData === undefined || questoesData.length === 0 ? (
				<div>Nenhuma questão disponivel</div>
			) : (
				questoesData.map((question) => {
					if (question.questionario === undefined) {
						question.questionario = {
							id: 0,
							titulo: '',
							questoes: [],
						};
					}
					question.questionario.id = Number(id);
					return <Questao key={question.id} questao={question} />;
				})
			)}
		</div>
	);
};

export default QuizEdit;
