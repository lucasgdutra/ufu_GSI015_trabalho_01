import * as React from 'react';
import { useContext } from 'react';
import { ActionTypes, AppContext } from '../store/Context';
import { navigate } from 'gatsby';
import { Navbar } from '../components/Navbar';

const Login = () => {
	const {
		state: { jogador },
		dispatch,
	} = useContext(AppContext);
	const [tempUsername, setTempUsername] = React.useState(jogador);
	const [alertMessage, setAlertMessage] = React.useState('');
	const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
		setTempUsername({
			name: event.target.value,
		});
	};
	const handleSave = () => {
		if (tempUsername === null || tempUsername?.name === '') {
			setAlertMessage('Nome de usuário não pode ser vazio');
		} else {
			dispatch({ type: ActionTypes.SET_JOGADOR, payload: tempUsername });
			navigate(`/jogar`);
		}
	};

	return (
		<>
			<Navbar />
			<div className="py-4 flex flex-col space-y-2 w-2/3 max-w-md mx-auto">
				<label
					className="block text-gray-700 text-sm font-bold mb-2"
					htmlFor="username"
				>
					Defina um nome de usuário para prosseguir
				</label>
				<input
					type="text"
					value={tempUsername?.name || ''}
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
				{alertMessage && (
					<div
						className={`alert mt-4 px-6 py-3 rounded shadow bg-red-500 text-center text-white`}
					>
						{alertMessage}
					</div>
				)}
			</div>
		</>
	);
};

export default Login;
