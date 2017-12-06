import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom'
import axios from 'axios';

import UsersList from './components/UsersList';
import About from './components/About';
import NavBar from './components/NavBar';
import Logout from './components/Logout';
import UserStatus from './components/UserStatus';
import Message from './components/Message';
import Footer from './components/Footer'
import RegisterForm from './components/forms/RegisterForm';
import LoginForm from './components/forms/LoginForm';
import Exercises from './components/Exercises';

class App extends Component {
  constructor() {
    super()
    this.state = {
      users: [],
      title: 'TestDriven.io',
      isAuthenticated: false,
      messageName: null,
      messageType: null
    }
  }
  componentWillMount() {
    if (window.localStorage.getItem('authToken')) {
      this.setState({ isAuthenticated: true });
    }
  }
  componentDidMount() {
    this.getUsers();
  }
  createMessage(name='Sanity Check', type='success') {
    this.setState({
      messageName: name,
      messageType: type
    })
    setTimeout(() => {
      this.removeMessage()
    }, 3000);
  }
  removeMessage() {
    this.setState({
      messageName: null,
      messageType: null
    })
  }
  getUsers() {
    axios.get(`${process.env.REACT_APP_USERS_SERVICE_URL}/users`)
    .then((res) => { this.setState({ users: res.data.data.users }); })
    .catch((err) => { console.log(err); })
  }
  logoutUser() {
    window.localStorage.clear();
    this.setState({ isAuthenticated: false });
  }
  loginUser(token) {
    window.localStorage.setItem('authToken', token);
    this.setState({ isAuthenticated: true });
    this.getUsers();
    this.createMessage('Welcome!', 'success');
  }
  render() {
    return (
      <div>
        <NavBar
          title={this.state.title}
          isAuthenticated={this.state.isAuthenticated}
        />
        <div className="container">
          {this.state.messageName && this.state.messageType &&
            <Message
              messageName={this.state.messageName}
              messageType={this.state.messageType}
              removeMessage={this.removeMessage.bind(this)}
            />
          }
          <div className="row">
            <div className="col-md-6">
              <br/>
              <Switch>
                <Route exact path='/' render={() => (
                  <Exercises
                    isAuthenticated={this.state.isAuthenticated}
                  />
                )} />
                <Route exact path='/all-users' render={() => (
                  <UsersList
                    users={this.state.users}
                  />
                )} />
                <Route exact path='/about' component={About}/>
                <Route exact path='/register' render={() => (
                  <RegisterForm
                    isAuthenticated={this.state.isAuthenticated}
                    loginUser={this.loginUser.bind(this)}
                    createMessage={this.createMessage.bind(this)}
                  />
                )} />
                <Route exact path='/login' render={() => (
                  <LoginForm
                    isAuthenticated={this.state.isAuthenticated}
                    loginUser={this.loginUser.bind(this)}
                    createMessage={this.createMessage.bind(this)}
                  />
                )} />
                <Route exact path='/logout' render={() => (
                  <Logout
                    logoutUser={this.logoutUser.bind(this)}
                    isAuthenticated={this.state.isAuthenticated}
                  />
                )} />
                <Route exact path='/status' render={() => (
                  <UserStatus
                    isAuthenticated={this.state.isAuthenticated}
                  />
                )} />
              </Switch>
            </div>
          </div>
        </div>
        <Footer/>
      </div>
    )
  }
}

export default App
