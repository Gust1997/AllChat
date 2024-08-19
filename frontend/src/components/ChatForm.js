function ChatForm() {
    return (
    <form>
        <label htmlFor="message">Message:</label>
        <input type="text" id="message" name="message"/>
        <input type="submit" value="Submit"/>
    </form>
)}

export default ChatForm;