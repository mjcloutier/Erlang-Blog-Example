import React, {Component} from "react"
import ReactDOM from "react-dom"
import {createStore} from "redux"
import {Provider, connect} from "react-redux"
import {addMessageReducer, Store, ChatChannel} from "../reducers/ChatMessages"
import socket from "../socket"
import shortid from "shortid"

console.log(ChatChannel)

export default class ChatMessageForm extends Component{
  constructor(){
    super()
    this.state = {
      message: {
        body: ""
      }
    }
  }

  componentDidMount(){
    Store.subscribe(() => {
      this.setState({
        message: {
          body: Store.getState().body
        }
      })
    })
  }

  submit(e){
    e.preventDefault()

    const messageBody = ReactDOM.findDOMNode(this.refs.messageBody).value.trim()
    const messageId = shortid.generate()
    const newMessage = {
      id: messageId,
      body: messageBody
    }

    // send to the reducer
    // Store.dispatch({
    //   type: "ADD",
    //   message: newMessage
    // })

    // push to the
    ChatChannel.push("shout", {
      message: newMessage
    })
  }

  render(){
    const {message} = this.state

    return (
      <form onSubmit={this.submit.bind(this)} className="col s12">
        <fieldset className="row">
          <div className="input-field">
            <input type="text" ref="messageBody" />
            <input type="submit" ref="btnSubmit"
              className="waves-effect waves-light btn" />
          </div>
        </fieldset>
      </form>
    )
  }

}

const dom = document.getElementById("ChatMessageForm")
if (dom){
  ReactDOM.render(<ChatMessageForm />, dom)
}
