import * as React from 'react';
import { useReducer, useState } from 'react';
import { QuizContext, QuizDispatchContext } from './Context';
interface ProviderProps {
	children: React.ReactNode;
}
const QuizProvider = ({ children }: ProviderProps) => {
	const [values, dispatch] = useReducer(
		(state: any, action: any) => {
			switch (action.type) {
				case 'DEFINE_QUIZ':
					return {
						...state,
						quiz: action.payload,
					};
					break;
				case 'DEFINE_QUESTION':
					return {
						...state,
						question: action.payload,
					};
					break;
				case 'DEFINE_ANSWER':
					return {
						...state,
						answer: action.payload,
					};
					break;
				default:
					return state;
			}
		},
		{ quiz: 'teste' },
	);

	return (
		<QuizContext.Provider value={values}>
			<QuizDispatchContext.Provider value={dispatch}>
				{children}
			</QuizDispatchContext.Provider>
		</QuizContext.Provider>
	);
};

export { QuizProvider, QuizProvider as default };
