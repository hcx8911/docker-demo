import React, { Component } from "react";
import { Redirect } from "react-router-dom";

class Form extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    if (this.props.isAuthenticated) {
      return <Redirect to="/" />;
    }
    return (
      <div>
        <h1>{this.props.formType}</h1>
        <hr />
        <br />
        <form onSubmit={event => this.props.handleUserFormSubmit(event)}>
          {this.props.formType === "Register" && (
            <div className="form-group">
              <input
                name="username"
                className="form-control input-lg"
                type="text"
                placeholder="Enter a username"
                required
                value={this.props.formData.username}
                onChange={this.props.handleFormChange}
              />
            </div>
          )}
          <div className="form-group">
            <input
              name="email"
              className="form-control input-lg"
              type="email"
              placeholder="Enter an email address"
              required
              value={this.props.formData.email}
              onChange={this.props.handleFormChange}
            />
          </div>
          <div className="form-group">
            <input
              name="password"
              className="form-control input-lg"
              type="password"
              placeholder="Enter a password"
              required
              value={this.props.formData.password}
              onChange={this.props.handleFormChange}
            />
          </div>
          <input
            type="submit"
            className="btn btn-primary btn-lg btn-block"
            value="Submit"
          />
        </form>
      </div>
    );
  }
}

export default Form;
