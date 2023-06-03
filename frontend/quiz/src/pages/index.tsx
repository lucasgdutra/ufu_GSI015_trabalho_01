import * as React from 'react';
import { useContext, useEffect, useState } from 'react';


import { useQuery } from '@tanstack/react-query';
import { HeadFC, PageProps, navigate } from 'gatsby';
import { Modal } from '../components/Modal';
import { ActionTypes, AppContext } from '../store/Context';

export const Head: HeadFC = () => <title>Quiz</title>;

interface QuizCardWrapperProps {
	children: React.ReactNode;
}
const QuizCardWrapper = ({ children }: QuizCardWrapperProps) => {
	return (
		<div className="grid sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
			{children}
		</div>
	);
};

interface QuizCardProps {
	questionario: Questionario;
}
const QuizCard = ({ questionario }: QuizCardProps) => {
	const [isOpen, setIsOpen] = useState(true);
	const { state: { username }, dispatch } = useContext(AppContext)

	useEffect(() => {
		if (username === '' || username === null) {
			dispatch({ type: ActionTypes.SET_USERNAME, payload: 'teste' });
		}
	}, [])

	const handleOpen = () => {
		if (username === '' || username === null) {
			dispatch({ type: ActionTypes.SET_USERNAME, payload: 'teste' });
			setIsOpen(true);
		}
		//else {
		// 	navigate(`/quiz/${questionario.id}`);
		// }
	};

	const handleClose = () => {
		setIsOpen(false);
	};

	const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
		dispatch({ type: ActionTypes.SET_USERNAME, payload: event.target.value });
	};

	const handleSave = () => {
		setIsOpen(false);
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
							onClick={handleOpen}
						>
							Começar
						</button>
						<Modal isOpen={isOpen} handleClose={handleClose}>
							<label
								className="block text-gray-700 text-sm font-bold mb-2"
								htmlFor="username"
							>
								Defina um nome de usuário antes de começar
							</label>
							<input
								type="text"
								value={username || ''}
								onChange={handleChange}
								className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
								id="username"
							/>
							<button
								onClick={handleSave}
								className="bg-indigo-500 text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
							>
								OK
							</button>
						</Modal>
					</div>
				</div>
			</div>
		</div>
	);
};

const Questionario: React.FC<PageProps> = () => {
	const { data, isLoading, isError } = useQuery<Questionario[]>({
		queryKey: ['questionarios'],
		queryFn: () => fetch('/api/questionarios').then((res) => res.json()),
	});
	//const { quiz } = useContext(QuizContext);

	if (isLoading) return <p>Carregando...</p>;
	if (isError) return <p>Erro</p>;
	return (
		<QuizCardWrapper>
			{data?.map((questionario) => (
				<QuizCard key={questionario.id} questionario={questionario} />
			))}
		</QuizCardWrapper>
	);
};



export default Questionario;
