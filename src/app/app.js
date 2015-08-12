'use strict'

import 'babelify/polyfill';
import React from 'react';

export default class App extends React.Component {
  static defaultProps = { title: 'Hello Docker!' };
  render() {
    return (
      <article className="docker">
        <h1>{this.props.title}</h1>
      </article>
    );
  }
};
