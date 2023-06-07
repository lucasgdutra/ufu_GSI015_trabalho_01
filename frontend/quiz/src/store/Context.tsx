import React, {
	createContext,
	Reducer,
	useEffect,
	useReducer,
	useRef,
} from 'react';
import typedLocalStorage from './typedLocalStorage';
import { endpoints } from '../config/api';
import axios from 'axios';
import { isEqual } from 'lodash';
import { useMutation } from '@tanstack/react-query';

type InitialStateType = {
	jogador: Jogador | null;
	questionario?: Questionario | null;
	jogo?: Jogo | null;
};

const initialState: InitialStateType = {
	jogador: typedLocalStorage.getItem<Jogador>('jogador'),
	questionario: null,
	jogo: null,
};
enum ActionTypes {
	SET_JOGADOR = 'SET_JOGADOR ',
	SET_QUESTIONARIO = 'SET_QUESTIONARIO',
	SET_JOGO = 'SET_JOGO',
}
interface Action {
	type: ActionTypes;
	payload: any;
}
const reducer: Reducer<InitialStateType, Action> = (state, action) => {
	switch (action.type) {
		case ActionTypes.SET_JOGADOR:
			if (action.payload === '' || action.payload === null) {
				typedLocalStorage.removeItem('jogador');
				return { ...state, jogador: null };
			}
			typedLocalStorage.setItem<Jogador>('jogador', action.payload);
			return { ...state, jogador: action.payload };
		case ActionTypes.SET_QUESTIONARIO:
			if (action.payload === '' || action.payload === null) {
				return { ...state, questionario: null };
			}
			return { ...state, questionario: action.payload };
		case ActionTypes.SET_JOGO:
			if (action.payload === '' || action.payload === null) {
				return { ...state, jogo: null };
			}
			return { ...state, jogo: action.payload };
		default:
			return state;
	}
};

const AppContext = createContext<{
	state: InitialStateType;
	dispatch: React.Dispatch<Action>;
}>({
	state: initialState,
	dispatch: () => null,
});

interface AppProviderProps {
	children: React.ReactNode;
}
const AppProvider = ({ children }: AppProviderProps) => {
	const [state, dispatch] = useReducer(reducer, initialState);

	const syncJogadorMutation = async (jogador: Jogador | null) => {
		if (!jogador) return null;
		try {
			const endpoint = endpoints.getJogadorByNome;
			const { data: jogadorServer } = await axios<Jogador>({
				url: endpoint.path(undefined, jogador.name),
				method: endpoint.method,
			});
			const updateEndpoint = endpoints.updateJogador;
			const { data: updatedJogador } = await axios<Jogador>({
				url: updateEndpoint.path(jogadorServer.id),
				method: updateEndpoint.method,
				data: { ...jogadorServer, ...jogador },
			});
			return updatedJogador;
		} catch (error) {
			try {
				const endpoint = endpoints.createJogador;
				const { data: jogadorServer } = await axios<Jogador>({
					url: endpoint.path(),
					method: endpoint.method,
					data: jogador,
				});
				return jogadorServer;
			} catch (error) {
				console.log(error);
			}
		}
	};

	const syncJogoMutation = async (jogo: Jogo | null) => {
		if (!jogo) return null;
		try {
			const endpoint = endpoints.createJogo;
			const { data: jogoServer } = await axios<Jogo>({
				url: endpoint.path(),
				method: endpoint.method,
				data: jogo,
			});
			return jogoServer;
		} catch (error) {
			console.log(error);
		}
	};

	const useSyncJogador = () => {
		const { mutate: syncJogador } = useMutation(syncJogadorMutation, {
			onError: (error) => console.log(error),
		});
		return syncJogador;
	};

	const useSyncJogo = () => {
		const { mutate: syncJogo } = useMutation(syncJogoMutation, {
			onError: (error) => console.log(error),
		});
		return syncJogo;
	};

	const prevJogador = useRef(state.jogador);
	const syncJogador = useSyncJogador();
	useEffect(() => {
		if (!isEqual(prevJogador.current, state.jogador)) {
			if (state.jogador) {
				syncJogador(state.jogador, {
					onSuccess: (updatedJogador) => {
						if (updatedJogador) {
							dispatch({
								type: ActionTypes.SET_JOGADOR,
								payload: updatedJogador,
							});
						}
					},
				});
			}
			prevJogador.current = state.jogador;
		}
	}, [state.jogador, syncJogador]);

	const prevJogo = useRef(state.jogo);
	const syncJogo = useSyncJogo();
	useEffect(() => {
		if (!isEqual(prevJogo.current, state.jogo)) {
			if (state.jogo) {
				syncJogo(state.jogo, {
					onSuccess: (updatedJogo) => {
						if (updatedJogo) {
							dispatch({
								type: ActionTypes.SET_JOGO,
								payload: updatedJogo,
							});
						}
					},
				});
			}
			prevJogo.current = state.jogo;
		}
	}, [state.jogo, syncJogo]);
	return (
		<AppContext.Provider value={{ state, dispatch }}>
			{children}
		</AppContext.Provider>
	);
};

export { AppContext, AppProvider, ActionTypes };
