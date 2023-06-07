import React, { useState } from 'react';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from '@tanstack/react-query-devtools';

import { AppProvider } from './src/store/Context';
const queryClient = new QueryClient();

interface WrapperProps {
	children: React.ReactNode;
}
const Wrapper: React.FC<WrapperProps> = ({ children }) => {
	return (
		<QueryClientProvider client={queryClient}>
			<AppProvider>
				<div className="bg-gray-100 h-screen">{children}</div>
			</AppProvider>
			<ReactQueryDevtools initialIsOpen={false} />
		</QueryClientProvider>
	);
};

export { Wrapper, Wrapper as default };
