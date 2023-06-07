import { type } from 'os';
import * as React from 'react';

interface AlertProps {
	type: 'error' | 'success' | 'info' | 'warning' | 'white';
	children: React.ReactNode;
}
const Alert = ({ type, children }: AlertProps) => {
	const [showAlert, setShowAlert] = React.useState<boolean>(true);
	if (!showAlert) {
		return null;
	}
	return (
		<div
			className={`alert mb-2 p-2 rounded shadow ${
				type === 'error'
					? 'bg-red-500'
					: type === 'success'
					? 'bg-green-500'
					: type === 'info'
					? 'bg-blue-500'
					: type === 'warning'
					? 'bg-yellow-500'
					: 'bg-white'
			}`}
		>
			<button className="float-right" onClick={() => setShowAlert(false)}>
				X
			</button>
			{children}
		</div>
	);
};

export { Alert, AlertProps, Alert as default };
