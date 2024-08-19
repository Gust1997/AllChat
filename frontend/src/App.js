import './App.css';
import Chatroom from './components/Chatroom';
import SearchBar from './components/SearchBar';

function App() {
  return (
    <div className="App">
      <SearchBar/>
      <Chatroom/>
    </div>
  );
}

export default App;
