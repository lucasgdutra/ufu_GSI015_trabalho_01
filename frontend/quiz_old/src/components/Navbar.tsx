import { Link } from 'gatsby';
import React, { useState } from 'react';

const Navbar = () => {
	const [isOpen, setIsOpen] = useState(false);

	return (
		<nav className="bg-white shadow-md">
			<div className="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
				<div className="relative flex items-center justify-between h-16">
					<div className="absolute inset-y-0 left-0 flex items-center sm:hidden">
						<button
							type="button"
							className="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-indigo-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
							aria-controls="mobile-menu"
							aria-expanded="false"
							onClick={() => setIsOpen(!isOpen)}
						>
							<span className="sr-only">Open main menu</span>
							<svg
								className={`${
									isOpen ? 'hidden' : 'block'
								} h-6 w-6`}
								xmlns="http://www.w3.org/2000/svg"
								fill="none"
								viewBox="0 0 24 24"
								stroke="currentColor"
								aria-hidden="true"
							>
								<path
									strokeLinecap="round"
									strokeLinejoin="round"
									strokeWidth="2"
									d="M4 6h16M4 12h16M4 18h16"
								/>
							</svg>
							<svg
								className={`${
									isOpen ? 'block' : 'hidden'
								} h-6 w-6`}
								xmlns="http://www.w3.org/2000/svg"
								fill="none"
								viewBox="0 0 24 24"
								stroke="currentColor"
								aria-hidden="true"
							>
								<path
									strokeLinecap="round"
									strokeLinejoin="round"
									strokeWidth="2"
									d="M6 18L18 6M6 6l12 12"
								/>
							</svg>
						</button>
					</div>
					<div className="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
						<div className="flex-shrink-0 flex items-center">
							<span className="font-semibold text-xl tracking-tight text-indigo-500">
								Jogo de Perguntas e Respostas
							</span>
						</div>
						<div className="hidden sm:block sm:ml-6">
							<div className="flex space-x-4">
								<Link
									to="/jogar"
									className="text-gray-500 hover:text-indigo-500 px-3 py-2 rounded-md text-sm font-medium"
								>
									Jogar
								</Link>
								<Link
									to="/ranking"
									className="text-gray-500 hover:text-indigo-500 px-3 py-2 rounded-md text-sm font-medium"
								>
									Ranking
								</Link>
								<Link
									to="/admin"
									className="text-gray-500 hover:text-indigo-500 px-3 py-2 rounded-md text-sm font-medium"
								>
									Admin
								</Link>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				className={`${isOpen ? 'block' : 'hidden'} sm:hidden`}
				id="mobile-menu"
			>
				<div className="px-2 pt-2 pb-3 space-y-1">
					<Link
						to="/jogar"
						className="text-gray-500 hover:text-indigo-500 block px-3 py-2 rounded-md text-base font-medium"
					>
						Jogar
					</Link>
					<Link
						to="/ranking"
						className="text-gray-500 hover:text-indigo-500 block px-3 py-2 rounded-md text-base font-medium"
					>
						Ranking
					</Link>

					<Link
						to="/admin"
						className="text-gray-500 hover:text-indigo-500 block px-3 py-2 rounded-md text-base font-medium"
					>
						Admin
					</Link>
				</div>
			</div>
		</nav>
	);
};

export { Navbar, Navbar as default };
