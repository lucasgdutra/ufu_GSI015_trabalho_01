import * as React from 'react';

import { useQuery } from '@tanstack/react-query';
import { HeadFC, PageProps } from 'gatsby';

import Navbar from '../components/Navbar';

export const Head: HeadFC = () => <title>Quiz</title>;

const Ranking: React.FC<PageProps> = () => {
	const { data, isLoading, isError } = useQuery<Jogador[]>({
		queryKey: ['players_ranking'],
		queryFn: () => fetch('/api/players/ranking').then((res) => res.json()),
	});

	if (isLoading) return <p>Carregando...</p>;
	if (isError) return <p>Erro</p>;
	return (
		<>
			<Navbar />
			<div className="flex flex-col mt-2 p-4">
				<h1 className="text-xl font-bold text-center">
					Top 25 Jogadores por pontuação
				</h1>
				<div className="overflow-x-auto sm:-mx-6 lg:-mx-8">
					<div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
						<div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
							<table className="min-w-full divide-y divide-gray-200">
								<thead className="bg-gray-50">
									<tr>
										<th
											scope="col"
											className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
										>
											Nome
										</th>
										<th
											scope="col"
											className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
										>
											Pontuação
										</th>
									</tr>
								</thead>
								<tbody className="bg-white divide-y divide-gray-200">
									{data?.map((jogador) => (
										<tr key={jogador.id}>
											<td className="px-6 py-4 whitespace-nowrap">
												<div className="text-sm text-gray-900">
													{jogador.name}
												</div>
											</td>
											<td className="px-6 py-4 whitespace-nowrap">
												<div className="text-sm text-gray-500">
													{jogador.pontuacao}
												</div>
											</td>
										</tr>
									))}
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</>
	);
};

export default Ranking;
