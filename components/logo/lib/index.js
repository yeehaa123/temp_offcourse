"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; desc = parent = getter = undefined; _again = false; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; continue _function; } } else if ("value" in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function _defineProperty(obj, key, value) { return Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) subClass.__proto__ = superClass; }

var _react = require("react");

var _react2 = _interopRequireDefault(_react);

var _classnames2 = require("classnames");

var _classnames3 = _interopRequireDefault(_classnames2);

var Logo = (function (_React$Component) {
  function Logo(props) {
    _classCallCheck(this, Logo);

    _get(Object.getPrototypeOf(Logo.prototype), "constructor", this).call(this, props);
    this.name = "logo";
  }

  _inherits(Logo, _React$Component);

  _createClass(Logo, [{
    key: "classes",
    value: function classes() {
      var _classnames;

      var _props = this.props;
      var mode = _props.mode;
      var extended = _props.extended;

      var modeClass = "" + this.name + "-is-" + mode;
      var extendedClass = "" + this.name + "-extended";

      return (0, _classnames3["default"])((_classnames = {}, _defineProperty(_classnames, this.name, true), _defineProperty(_classnames, modeClass, mode), _defineProperty(_classnames, extendedClass, extended), _classnames));
    }
  }, {
    key: "render",
    value: function render() {
      var _props2 = this.props;
      var mode = _props2.mode;
      var extended = _props2.extended;

      var title = mode === "learn" ? "Offcourse_" : "_Offcourse";

      var byline = _react2["default"].createElement(
        "div",
        { className: "" + this.name + "_byline" },
        _react2["default"].createElement(
          "p",
          { className: "textbar textbar-inverse" },
          "Learn"
        ),
        _react2["default"].createElement("br", null),
        _react2["default"].createElement(
          "p",
          { className: "textbar textbar-inverse" },
          "By Dwelling"
        )
      );

      return _react2["default"].createElement(
        "section",
        { className: this.classes() },
        _react2["default"].createElement(
          "p",
          { className: "textbar" },
          title
        ),
        extended && byline
      );
    }
  }]);

  return Logo;
})(_react2["default"].Component);

Logo.propTypes = {
  mode: _react2["default"].PropTypes.string,
  extended: _react2["default"].PropTypes.bool
};

exports["default"] = Logo;
module.exports = exports["default"];