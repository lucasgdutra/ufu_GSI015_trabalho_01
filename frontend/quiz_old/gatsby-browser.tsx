import * as React from 'react';
import './src/styles/global.css';
import Wrapper from './Wrapper';

export const wrapRootElement = ({ element }) => <Wrapper>{element}</Wrapper>;
