import React from "react";
import classnames from "classnames";

class TestComp extends React.Component {
  constructor(props){
    super(props);
    this.name = "test-comp";
  }

  classes(){
    return classnames({
      [this.name]: true
    });
  }

  render() {
    return (
      <section className={ this.classes() }>
      </section>
    );
  }
}

TestComp.propTypes = {

};
TestComp.propTypes = {

};

export default TestComp;
