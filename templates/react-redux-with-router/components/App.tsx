import * as React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import { ConnectedComponentOne } from './ComponentOne';
import { ComponentTwo } from './ComponentTwo';

// Import styles
import '../styles/app.scss';

const App = () => (
    <Router>
        <div>
            <Route exact path='/' component={ConnectedComponentOne} />
            <Route exact path='/page2' component={ComponentTwo} />
        </div>
    </Router>
);

export default App;
