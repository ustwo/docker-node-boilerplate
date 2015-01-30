window.React = require('react');
var Dispatcher = require('flux').Dispatcher;
var EventEmitter = require('events').EventEmitter;
var R = require('ramda');

var App = React.createClass({
  render: function () {
    return (
      <div>
        <h1>The app goes here</h1>
      </div>
    );
  }
});

React.render(
  <App />,
  document.getElementById('app')
);
