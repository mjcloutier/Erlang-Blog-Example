import React, {Component} from "react"
import ReactDOM from "react-dom"

import socket from "../socket"

let channel = socket.channel("item_list:lobby", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })


export default class PublishItem extends Component {

  constructor(){
    super()

    this.state = {
      respond: ""
    }
  }

  componentDidMount(){
    channel.on("shout", (payload) => {
      this.setState({
        respond: payload.item
      })
    })
  }

  handleSubmit(e){
    e.preventDefault()

    const itemInput = ReactDOM.findDOMNode(this.refs.itemInput)
    console.log(itemInput.value)

    channel.push("shout", {
      item: itemInput.value,
      ar: [
        {name: "One"},
        {name: "Two"},
        {name: "Three"},
      ]
    })

  }

  render(){

    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <legend>Publish</legend>
        <input ref="itemInput" />
        <p>Respond:</p>
        <div>{this.state.respond}</div>
      </form>
    )
  }
}

const dom = document.getElementById("PublishItem")
if (dom){
  ReactDOM.render(<PublishItem />, dom)
}
console.log(dom)
