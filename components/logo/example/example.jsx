import React from "react";
import Logo from "../src/index.jsx";

class Example extends React.Component {

  render() {
    return (
      <section>
        <Logo/>
        <Logo mode={ 'learn' }/>
        <Logo extended={ true } />
      </section>
    );
  }
}

export default Example;
