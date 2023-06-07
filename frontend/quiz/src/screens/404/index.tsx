import * as React from 'react';
import { Link, HeadFC, PageProps } from 'gatsby';

const NotFoundPage: React.FC<PageProps> = () => {
	return (
		<main className="flex flex-col items-center justify-center min-h-screen text-center bg-gray-100">
			<h1 className="text-4xl font-bold text-red-500">
				Pagina não encontrada
			</h1>
			<p className="mt-4 text-lg text-gray-700">
				Desculpe 😔, não encontramos a página que estava procurando.
				<br />
				<br />
				<Link
					className="inline-block bg-indigo-500 text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
					to="/"
				>
					Voltar para Página inicial
				</Link>
				.
			</p>
		</main>
	);
};

export default NotFoundPage;

export const Head: HeadFC = () => <title>Não encontrado</title>;
