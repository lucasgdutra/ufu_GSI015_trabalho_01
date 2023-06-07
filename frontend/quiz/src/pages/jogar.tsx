import * as React from 'react';

import { HeadFC, PageProps, navigate } from 'gatsby';

import Navbar from '../components/Navbar';
import { useContext, useEffect } from 'react';
import { ActionTypes, AppContext } from '../store/Context';
import { useQuizQuery, endpoints } from '../config/api';

export const Head: HeadFC = () => <title>Quiz</title>;

interface QuizCardWrapperProps {
	children: React.ReactNode;
}
const QuizCardWrapper = ({ children }: QuizCardWrapperProps) => {
	return (
		<div className="grid sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4 p-4">
			{children}
		</div>
	);
};

interface QuizCardProps {
	questionario: Questionario;
	jogador: Jogador;
}
const QuizCard = ({ questionario, jogador }: QuizCardProps) => {
	const { dispatch } = useContext(AppContext);
	const handleStartQuiz = () => {
		const jogo: Jogo = {
			questionario: questionario,
			jogador: jogador,
		};
		dispatch({ type: ActionTypes.SET_JOGO, payload: jogo });
		navigate(`/quiz/${questionario.id}`);
	};
	return (
		<div className="w-full mx-auto bg-white rounded-xl shadow-md overflow-hidden md:w-full m-4">
			<div className="md:flex items-center justify-center ">
				<div className="p-8">
					<div className="uppercase tracking-wide text-sm text-indigo-500 font-semibold text-center">
						{questionario.titulo}
					</div>
					<div className="flex items-center justify-center mt-5">
						<button
							className="bg-indigo-500 text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
							type="button"
							onClick={handleStartQuiz}
						>
							Começar
						</button>
					</div>
				</div>
			</div>
		</div>
	);
};

const Questionario: React.FC<PageProps> = () => {
	const {
		state: { jogador },
	} = useContext(AppContext);

	useEffect(() => {
		if (jogador === undefined || jogador === null || jogador.name === '') {
			navigate('/login');
		}
	}, [jogador]);

	const { data, isLoading, isError } = useQuizQuery<Questionario[]>({
		endpoint: endpoints.getQuestionarios,
		useQueryOptions: {
			enabled:
				jogador !== undefined &&
				jogador !== null &&
				jogador.name !== '',
		},
	});
	if (jogador === undefined || jogador === null || jogador.name === '') {
		return null;
	}
	if (isLoading || jogador === undefined) return <p>Carregando...</p>;
	if (isError) return <p>Erro</p>;
	return (
		<>
			<Navbar />
			<QuizCardWrapper>
				{data?.map((questionario) => (
					<QuizCard
						key={questionario.id}
						questionario={questionario}
						jogador={jogador}
					/>
				))}
			</QuizCardWrapper>
		</>
	);
};

export default Questionario;
