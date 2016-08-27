import {createStore} from "redux"
import {Provider, connect} from "react-redux"
import socket from "../socket"

export const addMessageReducer = function(state, action){

  if (state == undefined){
    return {}
  }

  switch(action.type){
    case "ADD":
      let newState = action.message
      return newState
    default:
      return state
  }
}
export const Store = createStore(addMessageReducer)

//
// Web sockets
//
const userToken = document.getElementsByTagName("head")[0].getAttribute("data-user-token")
// socket.connect(userToken)
socket.connect()

// Now that you are connected, you can join channels with a topic:
export const ChatChannel = socket.channel("chat_messages:lobby", {})
ChatChannel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

// dispatch on new message
ChatChannel.on("shout", (payload) => {
  Store.dispatch({
    type: "ADD", message: payload.message
  })
})
