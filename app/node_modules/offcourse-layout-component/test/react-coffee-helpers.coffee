helpers = require './react-helpers'
{ React, TestUtils, testdom } = helpers
{div} = React.DOM

renderElement = (Component, options) ->
  element = React.createElement Component, options
  container = TestUtils.renderIntoDocument element
  React.findDOMNode container

mockModule = (moduleUnderTest, mockModules) ->
  mockery = require 'mockery'
  mockery.registerAllowables([moduleUnderTest, 'react', './lib/React', 'classnames']);
  mockComponents = [One, Two, Three]
  mockModules.forEach (name, index) =>
    mockery.registerMock name, mockComponents[index % 3]
  mockery.enable
    warnOnReplace: false,
    warnOnUnregistered: true
  require moduleUnderTest

class MockComponent extends React.Component

  constructor: ->
    super

  render: -> 
    (div {className: @name })

class One extends MockComponent 

  constructor: ->
    super
    @name = "mock_one"

class Two extends MockComponent 

  constructor: ->
    super
    @name = "mock_two"

class Three extends MockComponent 

  constructor: ->
    super
    @name = "mock_three"


module.exports = { testdom, renderElement, mockModule }
