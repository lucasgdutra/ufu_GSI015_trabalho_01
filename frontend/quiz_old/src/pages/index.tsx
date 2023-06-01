import * as React from 'react';
import type { HeadFC, PageProps } from 'gatsby';
import Questionario from '../components/QuestionarioLista';

const IndexPage: React.FC<PageProps> = () => {
	return <Questionario />;
};

export default IndexPage;

export const Head: HeadFC = () => <title>Quiz</title>;
