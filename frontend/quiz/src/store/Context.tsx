import React, { createContext, Reducer, useReducer } from 'react';

const windowGlobal = typeof window !== 'undefined' && window
const localStorage = windowGlobal ? windowGlobal.localStorage : null


type InitialStateType = {
	username: string | null;
}

const initialState: InitialStateType = {
	username: localStorage?.getItem('username') || null
}
enum ActionTypes {
	SET_USERNAME = 'SET_USERNAME'
}
interface Action {
	type: ActionTypes;
	payload: any;
}
const reducer: Reducer<InitialStateType, Action> = (state, action) => {
	switch (action.type) {
		case ActionTypes.SET_USERNAME:
			if (action.payload === '' || action.payload === null) {
				localStorage?.removeItem('username');
				return { ...state, username: null };
			}
			localStorage?.setItem('username', action.payload);
			return { ...state, username: action.payload };
		default:
			return state;
	}
}



const AppContext = createContext<{
	state: InitialStateType,
	dispatch: React.Dispatch<Action>
}>({
	state: initialState,
	dispatch: () => null
});

interface AppProviderProps {
	children: React.ReactNode;
}
const AppProvider = ({ children }: AppProviderProps) => {
	const [state, dispatch] = useReducer(reducer, initialState);

	return (
		<AppContext.Provider value={{ state, dispatch }}>
			{children}
		</AppContext.Provider>
	)
}

export { AppContext, AppProvider, ActionTypes };