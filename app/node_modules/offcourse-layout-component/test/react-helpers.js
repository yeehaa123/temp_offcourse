import React from 'react/addons';
import { jsdom } from 'jsdom';

function testdom(markup){
  if (typeof document !== 'undefined') return
  global.document = jsdom(markup || '')
  global.window = document.defaultView;
  global.navigator = {};
}

let TestUtils = React.addons.TestUtils;

export { React, TestUtils, testdom };
