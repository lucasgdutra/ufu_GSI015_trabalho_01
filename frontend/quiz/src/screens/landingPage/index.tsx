import React, { FC, useContext } from 'react';
import { Link, PageProps, navigate } from 'gatsby';
import { AppContext } from '../../store/Context';

const LandingPage: FC<PageProps> = () => {
	const {
		state: { jogador: username },
	} = useContext(AppContext);

	const handleClick = () => {
		if (
			username === undefined ||
			username === null ||
			username.name === ''
		) {
			navigate(`/login`);
		} else {
			navigate(`/jogar`);
		}
	};

	return (
		<div className="flex flex-col items-center justify-center h-screen text-indigo-500">
			<h1 className="text-4xl font-bold mb-8 text-center">
				Jogo de Perguntas e Respostas
			</h1>
			<div className="space-y-4 flex flex-col text-center">
				<button onClick={handleClick} className="text-2xl">
					Jogar
				</button>
				<Link to="/ranking" className="text-2xl">
					Ranking
				</Link>
			</div>
		</div>
	);
};

export default LandingPage;
