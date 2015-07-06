"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; desc = parent = getter = undefined; _again = false; if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; continue _function; } } else if ("value" in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) subClass.__proto__ = superClass; }

var _react = require("react");

var _react2 = _interopRequireDefault(_react);

var _classnames2 = require("classnames");

var _classnames3 = _interopRequireDefault(_classnames2);

var _lodash = require("lodash");

var _lodash2 = _interopRequireDefault(_lodash);

var CardSectionField = (function (_React$Component) {
  function CardSectionField(props) {
    _classCallCheck(this, CardSectionField);

    _get(Object.getPrototypeOf(CardSectionField.prototype), "constructor", this).call(this, props);
    this.name = "card_field";
  }

  _inherits(CardSectionField, _React$Component);

  _createClass(CardSectionField, [{
    key: "classes",
    value: function classes() {
      return (0, _classnames3["default"])(_defineProperty({}, this.name, true));
    }
  }, {
    key: "render",
    value: function render() {
      var _props = this.props;
      var title = _props.title;
      var field = _props.field;

      if (!title) {
        return _react2["default"].createElement(
          "h1",
          { className: this.classes() },
          field
        );
      }
      title = title.toLowerCase();
      return _react2["default"].createElement(
        "p",
        { className: this.classes() },
        _lodash2["default"].capitalize(title),
        ": ",
        field
      );
    }
  }], [{
    key: "propTypes",
    value: function propTypes() {
      return {
        title: _react2["default"].PropTypes.string,
        field: _react2["default"].PropTypes.string.isRequired
      };
    }
  }]);

  return CardSectionField;
})(_react2["default"].Component);

exports["default"] = CardSectionField;
module.exports = exports["default"];