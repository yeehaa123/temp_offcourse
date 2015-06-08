{ renderElement, testdom, mockModule } = require './react-coffee-helpers'

describe "Layout Container", ->

  beforeAll ->
    moduleUnderTest = '../src/layout-container.jsx'
    mockModules = [
      'offcourse-sidebar-container'
      'offcourse-main-container'
    ]

    @Component = mockModule moduleUnderTest, mockModules

  Given -> testdom '<html><body></body></html>'
  Given -> @appState =
    levels: {}
    modes:
      current: 'bar'
  Given ->
    @viewModel =
      model: {}

  describe "during browsing", ->
    Given -> @appState.levels.current = 'browsing'
    When  -> @subject = renderElement @Component, { @appState, @viewModel }
    Then  -> @classes = @subject.className.split ' '
    And   -> @classes.includes 'app'
    And   -> @classes.includes 'app-is-browsing'
    And   -> @classes.includes 'app-is-bar'

    describe "left sidebar", ->
      Then -> @container = @subject.querySelectorAll '.layout-sidebar.layout-sidebar-left'
      And  -> @container.length == 1
      And  -> @container[0].querySelectorAll('.mock_one').length == 1

    describe "main area", ->
      Then -> @container = @subject.querySelectorAll '.layout-main'
      And  -> @main = @container[0].querySelectorAll('.mock_two')
      And  -> @start = @container[0].querySelectorAll('.mock_three')
      And  -> @container.length == 1
      And  -> @main.length == 1
      And  -> @start.length == 0

  describe "during introduction", ->
    Given -> @appState.levels.current = 'introduction'
    When  -> @subject = renderElement @Component, { @appState, @viewModel }
    Then  -> @classes = @subject.className.split ' '
    And   ->  @classes.includes 'app-is-introduction'

    describe "main area", ->
      Then  -> @container = @subject.querySelectorAll '.layout-main'
      And   -> @main = @container[0].querySelectorAll('.mock_two')
      And   -> @start = @container[0].querySelectorAll('.mock_three')
      And   -> @main.length == 0
      And   -> @start.length == 1
