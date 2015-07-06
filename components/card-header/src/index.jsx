import React from "react";
import classnames from "classnames";

class CardHeader extends React.Component {

  constructor(props){
    super(props);
    this.name = "card_header";
  }

  classes(){
    return classnames({
      [this.name]: true
    });
  }

  render(){
    let { image } = this.props;
    return (
      <section className={ this.classes() }>
        { image }
      </section>
    );
  }
}

CardHeader.propTypes = {
  image: React.PropTypes.node.isRequired
};

export default CardHeader;
