import React, {Component} from "react";
import ReactDOM from "react-dom";
import {createStore} from "redux"
import {Provider, connect} from "react-redux"
import {addMessageReducer, Store} from "../reducers/ChatMessages"

export default class ChatMessageList extends Component {
  constructor(){
    super()

    this.state = {
      messages: new Array()
    }
  }

  componentDidMount(){
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
      <div className="messages">
        {
          (messages.length > 0)?
            messages.map(message => (
              <div key={message.id}>{message.body}</div>
            ))
          : <div>
            <p>No messages yet</p>
          </div>
        }
      </div>
    )
  }

}

const dom = document.getElementById("ChatMessages");
if (dom){
  ReactDOM.render(<ChatMessageList />, dom)
}
