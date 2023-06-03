import { createContext } from 'react';

interface QuizContextProps {
	quiz: any;
	question: any;
	answer: any;
	username?: string;
}
const QuizContext = createContext<QuizContextProps>({} as QuizContextProps);

interface QuizContextDispatchProps {
	setQuiz: (quiz: any) => void;
	setQuestion: (question: any) => void;
	setAnswer: (answer: any) => void;
	setUsername: (username: string) => void;
}
const QuizDispatchContext = createContext<QuizContextDispatchProps>(
	{} as QuizContextDispatchProps,
);

export { QuizContext, QuizContext as default, QuizDispatchContext };
