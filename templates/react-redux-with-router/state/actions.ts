/**
 * Redux Actions.
 * Actions can be created as below using the typescript-fsa library (https://www.npmjs.com/package/typescript-fsa)
 */
import actionCreatorFactory from 'typescript-fsa';
 
const actionCreator = actionCreatorFactory();

export const setRandomString = actionCreator<{ randomString: string }>('SET_RANDOM_STATE');
export const setRandomBoolean = actionCreator<{ randomBoolean: boolean }>('SET_RANDOM_STATE');
