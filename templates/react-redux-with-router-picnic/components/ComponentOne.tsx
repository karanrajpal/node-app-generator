import * as React from 'react';
import { connect } from 'react-redux';
import { setRandomName } from '../state/actions';
import { Link } from 'react-router-dom';

type ComponentOnePropsType = {
    name: string;
    setRandomName: () => {};
};

const ComponentOne = (props: ComponentOnePropsType) => (
    <div className='component-one'>
        <h1>Welcome to the main page of your app, {props.name}</h1>
        <button onClick={props.setRandomName}>I want a new name</button>
        <br />
        <Link to='/page2'>Go to page 2</Link>
    </div>
);

export const ConnectedComponentOne = connect(
    (state) => ({
        name: state.randomName,
    }),
    (dispatch) => ({
        setRandomName: () => {
            const nameList = ['Astro Boy', 'Golden Girl', 'Annoying Frog', 'Peaceful Blob'];
            const randomName = nameList[Math.floor(Math.random() * nameList.length)];
            dispatch(setRandomName({ randomName }));
        },
    })
)(ComponentOne);
