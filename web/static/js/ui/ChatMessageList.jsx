import React, {Component} from "react";
import ReactDOM from "react-dom";
import {createStore} from "redux"
import {Provider, connect} from "react-redux"
import {addMessageReducer, Store} from "../reducers/ChatMessages"
import materialize from "materialize"

export default class ChatMessageList extends Component {
  constructor(){
    super()

    this.state = {
      messages: new Array()
    }
  }

  componentWillMount(){
    // Load initial data


    // Subscribe
    Store.subscribe(() => {
      const newMessage = Store.getState()
      let messages = this.state.messages.concat(newMessage)

      this.setState({
        messages: messages
      })
    })
  }

  render(){
    const {messages} = this.state

    return (
      <ul className="messages collection">
        {
          (messages.length > 0)?
            messages.map(message => (
              <li
                key={message.id}
                className="collection-item">
                <span>{message.body} {message.created_at}</span>
              </li>
            ))
          : <li className="collection-item">
            <span>No messages yet</span>
          </li>
        }
      </ul>
    )
  }

}

const dom = document.getElementById("ChatMessages");
if (dom){
  ReactDOM.render(<ChatMessageList />, dom)
}
