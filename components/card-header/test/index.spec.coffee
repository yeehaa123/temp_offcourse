require './helpers'
describe "Card Section Component", ->

  beforeAll ->
    moduleUnderTest = "../src/index.jsx"
    mockModules = []
    { @Component, @spy } = mockModule moduleUnderTest, mockModules

  afterAll ->
    disableMocks()

  Given -> 
    testdom "<html><body></body></html>"
    @image = "Bar"

  When  -> @subject  = renderElement @Component, { @image }
  Then  -> @classes = @subject.className.split ' '
  And   -> @classes.includes "card_header"
  And   -> @subject.textContent.includes "Bar"
