import { createContext } from 'react';

interface QuizContextProps {
	quiz: any;
	question: any;
	answer: any;
}
const QuizContext = createContext<QuizContextProps>({quiz: 'teste'} as QuizContextProps);
const QuizDispatchContext = createContext<React.Dispatch<any> | null>(null);

export { QuizContext, QuizContext as default, QuizDispatchContext };
