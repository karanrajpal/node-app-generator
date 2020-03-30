import * as React from 'react';
import { connect } from 'react-redux';

type ComponentOnePropsType = {
    name: string;
};

const ComponentOne = (props: ComponentOnePropsType) => (
    <div className='component-one'>
        <h1>Welcome to the main page of your app, {props.name}</h1>
    </div>
);

export const ConnectedComponentOne = connect(
    (state) => ({
        name: state.randomState,
    }),
)(ComponentOne);
