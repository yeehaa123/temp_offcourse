require './helpers'

describe "Level Button Component", ->

  beforeAll ->
    moduleUnderTest = "../src/index.jsx"
    mockModules = []
    { @Component } = mockModule moduleUnderTest, mockModules

  afterAll ->
    disableMocks()

  Given -> 
    testdom "<html><body></body></html>"
    @mode = "foo"
  
  describe "Not Extended", ->
    When  -> @subject  = renderElement @Component, { @mode }
    Then  -> @classes = @subject.className.split ' '
    And   -> @classes.includes "logo"
    And   -> @classes.includes "logo-is-foo"
    And   -> @subject.querySelectorAll(".logo_byline").length == 0

  describe "Extended", ->
    Given -> @extended = true
    When  -> @subject  = renderElement @Component, { @mode, @extended }
    Then  -> @classes = @subject.className.split ' '
    And   -> @classes.includes "logo"
    And   -> @classes.includes "logo-extended"
    And   -> @classes.includes "logo-is-foo"
    And   -> @subject.querySelectorAll(".logo_byline").length == 1
