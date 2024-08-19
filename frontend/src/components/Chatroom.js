import "../styles/Chatroom.css"

import ChatDisplay from "./ChatDisplay";
import ChatForm from "./ChatForm";

function Chatroom() {
    return (
    <div className="chatroom">
        <ChatDisplay/>
        <ChatForm/>
    </div>
)}

export default Chatroom;