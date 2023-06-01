import React, { useState } from 'react';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import Navbar from './src/components/Navbar';
import { QuizProvider } from './src/store/Provider';
const queryClient = new QueryClient();

interface WrapperProps {
	children: React.ReactNode;
}
const Wrapper: React.FC<WrapperProps> = ({ children }) => {
	return (
		<QuizProvider>
			<QueryClientProvider client={queryClient}>
				<Navbar />
				{children}
			</QueryClientProvider>
		</QuizProvider>
	);
};

export { Wrapper, Wrapper as default };
