{ renderElement, testdom, mockModule } = require './react-coffee-helpers'

describe "Layout Container", ->

  beforeAll ->
    moduleUnderTest = "../src/layout-container.jsx"
    mockModules = [
      "offcourse-sidebar-container"
      "offcourse-main-container"
    ]

    @Component = mockModule moduleUnderTest, mockModules

  Given -> testdom "<html><body></body></html>"
  Given ->
    @appState =
      levels:
        current: "browsing"
      modes:
        current: "bar"
    @viewModel =
      model: {}

  When  ->
    subject  = renderElement @Component, { @appState, @viewModel }
    @classes = subject.className.split ' '
    @sidebar = subject.querySelectorAll(".mock_one")
    @main    = subject.querySelectorAll(".mock_two")

  Then  -> @classes.includes "app"
  And   -> @classes.includes "app-is-browsing"
  And   -> @classes.includes "app-is-bar"
  And   -> @sidebar.length == 1
  And   -> @main.length == 1
