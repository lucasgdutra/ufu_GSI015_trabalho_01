import React, { FC, useContext, useEffect } from 'react';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';
import { Navbar } from '../../components/Navbar';
import { PageProps, navigate } from 'gatsby';
import { AppContext } from '../../store/Context';
import endpoints, { useQuizMutation, useQuizQuery } from '../../config/api';
import NovoQuestionario from './adicionarNovoQuestionario';

const deleteQuiz = async (id: Questionario['id']) => {
	const res = await axios.delete(`/api/questionarios/${id}`);
	if (res.status !== 200) {
		throw new Error('Erro ao deletar questionario');
	}
};

const AdminPage: FC<PageProps> = () => {
	const {
		state: { jogador },
	} = useContext(AppContext);
	useEffect(() => {
		if (jogador === undefined || jogador === null || jogador.name === '') {
			navigate('/login');
		}
	}, [jogador]);

	const queryClient = useQueryClient();
	const { data, isLoading, error } = useQuizQuery<Questionario[]>({
		endpoint: endpoints.getQuestionarios,
		useQueryOptions: {
			enabled:
				jogador !== undefined &&
				jogador !== null &&
				jogador.name !== '',
		},
	});

	const {
		mutate: mutateDelete,
		isLoading: isDeleting,
		isError: hasError,
		isSuccess: isDeleted,
		reset: resetDelete,
	} = useMutation(deleteQuiz, {
		onSuccess: () => {
			queryClient.invalidateQueries({
				queryKey: [endpoints.getQuestionarios.path()],
			});
			setTimeout(() => {
				resetDelete();
			}, 2000);
		},
	});

	const handleDeleteQuiz = (id: Questionario['id']) => {
		mutateDelete(id);
	};

	if (isLoading) return <div>Carregando...</div>;
	if (error) {
		return (
			<div>
				<p>Erro ao carregar questionarios</p>
				<p>{error.response?.data.message}</p>
			</div>
		);
	}
	if (data === undefined || data.length === 0)
		return <div>Nenhum questionario disponivel</div>;
	return (
		<>
			<Navbar />
			<div className="antialiased sans-serif p-4 space-y-2">
				<NovoQuestionario />
				{(isDeleting || isDeleted || hasError) && (
					<div
						className={`alert mt-4 px-6 py-3 rounded shadow ${
							isDeleting
								? 'bg-blue-100 border-blue-500 text-blue-900'
								: isDeleted
								? 'bg-green-100 border-green-500 text-green-900'
								: hasError
								? 'bg-red-100 border-red-500 text-red-900'
								: 'bg-white border-gray-500 text-gray-900'
						}`}
					>
						{isDeleting && 'Deletando...'}
						{isDeleted && 'Deletado com sucesso'}
						{hasError && 'Erro ao deletar'}
					</div>
				)}
				<table className="table-auto min-w-full divide-y divide-gray-200">
					<thead className="bg-gray-50">
						<tr>
							<th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								ID
							</th>
							<th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Titulo
							</th>
							<th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Ações
							</th>
						</tr>
					</thead>
					<tbody className="bg-white divide-y divide-gray-200">
						{data.map((quiz) => (
							<tr key={quiz.id}>
								<td className="px-6 py-4 whitespace-nowrap">
									<span className="text-sm text-gray-900">
										{quiz.id}
									</span>
								</td>
								<td className="px-6 py-4 whitespace-nowrap">
									<span className="text-sm text-gray-900">
										{quiz.titulo}
									</span>
								</td>
								<td className="px-6 py-4 whitespace-nowrap">
									<button
										className="bg-indigo-500 text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
										onClick={() =>
											navigate(`/admin/quiz/${quiz.id}`)
										}
									>
										Editar
									</button>
									<button
										onClick={() =>
											handleDeleteQuiz(quiz.id)
										}
										className="bg-red-500 text-white active:bg-red-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
									>
										Deletar
									</button>
								</td>
							</tr>
						))}
					</tbody>
				</table>
			</div>
		</>
	);
};

export default AdminPage;
