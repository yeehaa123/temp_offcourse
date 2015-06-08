import { React, TestUtils, fixtures, testdom } from './react-helpers';
import mockery from 'mockery';

let Unacademic;
describe("Unacademic", () => {
  let element;
  let moduleUnderTest = '../src/Unacademic.jsx';
  let spy;

  beforeEach(() => {
    mockery.registerAllowables([moduleUnderTest, 'react', './lib/React', 'classnames']);

    class MockComponent extends React.Component {

      constructor(){
        super();
        this.name = 'mock';
      }

      render(){
        return <div className={ this.name }></div>
      }
    }

    class Start extends MockComponent {
      constructor(){
        super();
        this.name = 'mock-intro';
      }
    }


    mockery.registerMock('../sidebar/Sidebar.jsx', MockComponent);
    mockery.registerMock('../main/Main.jsx', MockComponent);
    mockery.registerMock('../start/Start.jsx', Start);

    mockery.enable({
      warnOnReplace: false,
      warnOnUnregistered: true
    });

    Unacademic = require(moduleUnderTest);
    testdom('<html><body></body></html>');
    let { appState, viewModel } = fixtures;
    element = renderElement(viewModel, appState);
  });

  it("renders the container with the correct classes", () => {
    let classes = element.className.split(" ");
    expect(classes).to.contain('app');
    expect(classes).to.contain('app-is-learn');
    expect(classes).to.contain('app-is-waypoints');
  });

  describe("left sidebar", () => {
    let container;

    it("renders the container", () => {
      container = element.querySelectorAll('.layout-sidebar.layout-sidebar-left');
      expect(container.length).to.equal(1);
    });

    it("renders the sidebar component", () => {
      let sidebar = container[0].querySelectorAll('.mock');
      expect(sidebar.length).to.equal(1);
    });
  });

  describe("main area", ()=> {
    let main;

    it("renders the container", () => {
      main = element.querySelectorAll('.layout-main');
      expect(main.length).to.equal(1);
    });

    describe("during browsing", ()=> {

      it("renders the topbar", () => {
        let container = main[0].querySelectorAll('.mock');
        expect(container.length).to.equal(1);
      });

      it("renders the topbar", () => {
        let container = main[0].querySelectorAll('.mock-intro');
        expect(container.length).to.equal(0);
      });

    });

    describe("during browsing", ()=> {

      beforeEach(() => {
        testdom('<html><body></body></html>');
        let { appState, viewModel } = fixtures;
        appState.levels.current = 'introduction';
        element = renderElement(viewModel, appState);
        main = element.querySelectorAll('.layout-main');
      });

      it("renders the topbar", () => {
        let container = main[0].querySelectorAll('.mock');
        expect(container.length).to.equal(0);
      });

      it("renders the topbar", () => {
        let container = main[0].querySelectorAll('.mock-intro');
        expect(container.length).to.equal(1);
      });
    });
  });
});

function renderElement(viewModel, appState){
  let container = TestUtils.renderIntoDocument(
    <Unacademic viewModel={ viewModel } appState={ appState } />
  );

  return React.findDOMNode(container);
}
