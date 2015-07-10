require './helpers'

describe "Test Comp Component", ->

  beforeAll ->
    moduleUnderTest = "../src/index.jsx"
    mockModules = []
    { @Component } = mockModule moduleUnderTest, mockModules

  afterAll ->
    disableMocks()

  Given -> 
    testdom "<html><body></body></html>"
  
  describe "Not Extended", ->
    When  -> @subject  = renderElement @Component
    Then  -> @classes = @subject.className.split ' '
    And   -> @classes.includes "test-comp"
