import React from "react";
import classnames from "classnames";

class Logo extends React.Component {
  constructor(props){
    super(props);
    this.name = "logo";
  }

  classes(){
    let { mode, extended } = this.props;
    let modeClass = `${this.name}-is-${mode}`;
    let extendedClass = `${this.name}-extended`;

    return classnames({
      [this.name]: true,
      [modeClass]: mode,
      [extendedClass]: extended
    });
  }

  render() {
    let { mode, extended } = this.props;
    let title = mode === "learn" ? "Offcourse_" : "_Offcourse";

    let byline = (
      <div className={ `${this.name}_byline` }>
        <p className="textbar textbar-inverse">Learn</p><br/>
        <p className="textbar textbar-inverse">By Dwelling</p>
      </div>
    );

    return (
      <section className={ this.classes() }>
        <p className="textbar">{ title }</p>
        { extended && byline }
      </section>
    );
  }
}

Logo.propTypes = {
  mode: React.PropTypes.string,
  extended: React.PropTypes.bool
};

export default Logo;
