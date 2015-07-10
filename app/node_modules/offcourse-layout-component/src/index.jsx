import React from "react";
import classnames from "classnames";

import SidebarContainer from "offcourse-sidebar-container";
import MainContainer from "offcourse-main-container";

class Unacademic extends React.Component{

  constructor(props){
    super(props);
    this.name = "app";
  }

  classes(){
    let { levels, modes } = this.props.appState;
    let levelClass = `${this.name}-is-${levels.current}`;
    let modeClass = `${this.name}-is-${modes.current}`;

    return classnames({
      [this.name]: true,
      [levelClass]: levels.current,
      [modeClass]: modes.current
    });
  }

  render() {
    return (
      <section className={ this.classes() }>
        <SidebarContainer {...this.props}/>
        <MainContainer {...this.props}/>
      </section>
    );
  }
}

Unacademic.propTypes = {
  appState: React.PropTypes.object.isRequired,
  viewModel: React.PropTypes.object
};

export default Unacademic;
