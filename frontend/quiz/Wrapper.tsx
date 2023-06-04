import React, { useState } from 'react';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

import { AppProvider } from './src/store/Context';
const queryClient = new QueryClient();

interface WrapperProps {
	children: React.ReactNode;
}
const Wrapper: React.FC<WrapperProps> = ({ children }) => {
	return (
		<AppProvider>
			<QueryClientProvider client={queryClient}>
				<div className="bg-gray-100 h-screen">{children}</div>
			</QueryClientProvider>
		</AppProvider>
	);
};

export { Wrapper, Wrapper as default };
