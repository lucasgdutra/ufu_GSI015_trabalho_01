import * as React from 'react';
import Wrapper from './Wrapper';
import { StrictMode } from 'react';

export const wrapPageElement = ({ element }) => <Wrapper>{element}</Wrapper>;

export const wrapRootElement = ({ element }) => <StrictMode>{element}</StrictMode>;