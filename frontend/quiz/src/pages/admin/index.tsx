import React, { FC, useContext, useState, startTransition } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import axios from 'axios';
import { Navbar } from '../../components/Navbar';
import { navigate } from 'gatsby';
import { AppContext } from '../../store/Context';

const fetchQuizzes = async () => {
	const res = await axios.get('/api/questionarios');
	return res.data;
};

const deleteQuiz = async (id: Questionario['id']) => {
	const res = await axios.delete(`/api/questionarios/${id}`);
	if (res.status !== 200) {
		throw new Error('Erro ao deletar questionario');
	}
};

const AdminPage: FC = () => {
	const {
		state: { username },
	} = useContext(AppContext);
	if (username === '' || username === null) navigate('/login');

	const queryClient = useQueryClient();
	const { data, isLoading, error } = useQuery<Questionario[]>({
		queryKey: ['quizzes'],
		queryFn: fetchQuizzes,
		enabled: username !== undefined && username !== '' && username !== null,
	});
	const [alertMessage, setAlertMessage] = useState<string>('');

	const mutation = useMutation(deleteQuiz, {
		onSuccess: () => {
			queryClient.invalidateQueries(['quizzes']);
			startTransition(() => {
				setAlertMessage('Questionario deletado com sucesso');
				setTimeout(() => {
					setAlertMessage('');
				}, 5000);
			});
		},
	});

	const handleDeleteQuiz = (id: Questionario['id']) => {
		startTransition(() => {
			setAlertMessage('Deletando questionario de ID: ' + id + '...');
		});
		mutation.mutate(id);
	};

	if (isLoading) return <div>Carregando...</div>;
	if (error)
		return <div>Erro ao carregar questionarios {error as string} </div>;
	if (data === undefined || data.length === 0)
		return <div>Nenhum questionario disponivel</div>;
	return (
		<>
			<Navbar />
			<div className="antialiased sans-serif p-4 space-y-2">
				<button className="px-4 py-2 bg-green-500 text-white rounded">
					Adicionar novo questionário
				</button>
				{alertMessage && (
					<div
						className={
							'alert mt-4 px-6 py-3 rounded shadow bg-blue-500'
						}
					>
						{alertMessage}
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
