/**
 * Application Redux Reducer.
 * If your application gets bigger, break app out into smaller reducers and use combineReducers here
 */
import {isType} from 'typescript-fsa';
import {
    setRandomBoolean,
    setRandomString,
} from './actions';


export const initialState = {
    randomString: '',
    randomBoolean: false,
};

// Define and export reducer
const AppReducer = (state = initialState, action: Action) => {
    if (isType(action, setRandomString)) {
        return {
            ...state,
            randomString: action.payload.randomString,
        };
    }
    if (isType(action, setRandomBoolean)) {
        return {
            ...state,
            randomBoolean: action.payload.randomBoolean,
        };
    }
    return state;
};

export default AppReducer;
