import React from "react";
import classnames from "classnames";

class {{ capital name  }} extends React.Component {
  constructor(props){
    super(props);
    this.name = "{{ kebab name }}";
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

{{ capital name  }}.propTypes = {

};
{{ capital name  }}.propTypes = {

};

export default {{ capital name  }};
