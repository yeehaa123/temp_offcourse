helpers = require './react-coffee-helpers'
{ renderElement, testdom, mockModule } = helpers

describe "App Component", ->

  beforeAll ->
    moduleUnderTest = '../src/Unacademic.jsx'
    mockModules = [
      '../sidebar/Sidebar.jsx'
      '../main/Main.jsx'
      '../start/Start.jsx'
    ]
    @Component = mockModule moduleUnderTest, mockModules

  Given ->
    testdom '<html><body></body></html>'
    @appState =
      levels:
        current: 'foo'
      modes:
        current: 'bar'

    @viewModel =
      model: {}

    @subject = renderElement @Component, { @appState, @viewModel }

  describe "app container", ->
    When -> @classes = @subject.className.split ' '
    Then -> @classes.includes 'app'
    And ->  @classes.includes 'app-is-foo'
    And ->  @classes.includes 'app-is-bar'

  describe "left sidebar", ->
    When -> @container = @subject.querySelectorAll '.layout-sidebar.layout-sidebar-left'
    Then -> @container.length == 1
    And  -> @container[0].querySelectorAll('.mock_one').length == 1

  describe "main area", ->
    When -> @container = @subject.querySelectorAll '.layout-main'
    Then -> @container.length == 1

    describe "during browsing", ->
      When -> 
        @main = @container[0].querySelectorAll('.mock_two')
        @start = @container[0].querySelectorAll('.mock_three')
      Then  -> @main.length == 1
      And  -> @start.length == 0

    describe "during introduction", ->
      Given ->
        @appState.levels.current = 'introduction'
        @subject = renderElement @Component, { @appState, @viewModel }
        @container = @subject.querySelectorAll '.layout-main'
      When -> 
        @main = @container[0].querySelectorAll('.mock_two')
        @start = @container[0].querySelectorAll('.mock_three')
      Then  -> @main.length == 0
      And  -> @start.length == 1
