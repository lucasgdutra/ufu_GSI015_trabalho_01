import * as React from 'react';

interface ModalProps {
	isOpen: boolean;
	handleClose: () => void;
	children: React.ReactNode;
}
const Modal = ({ isOpen, handleClose, children }: ModalProps) => {
	if (!isOpen) {
		return null;
	}

	return (
		<div className="fixed inset-0 flex items-center justify-center z-50">
			<div className="bg-white rounded-lg p-8 border border-gray-200 shadow-lg relative">
				<button
					onClick={handleClose}
					className="absolute right-3 top-3 text-gray-700"
				>
					X
				</button>
				{children}
			</div>
		</div>
	);
};

export { Modal, Modal as default };
