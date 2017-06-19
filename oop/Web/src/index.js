// Application entrypoint.

// Load up the application styles
require("../styles/styles.css");

// Render the top-level React component
import React from 'react';
import ReactDOM from 'react-dom';
import App from 'app';
import '../styles/styles.css';

ReactDOM.render(<App />, document.getElementById('react-root'));
