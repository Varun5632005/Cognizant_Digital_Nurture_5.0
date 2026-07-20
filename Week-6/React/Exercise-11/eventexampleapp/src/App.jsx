import Counter from "./components/Counter";
import Welcome from "./components/Welcome";
import SyntheticEvent from "./components/SyntheticEvent";
import CurrencyConvertor from "./components/CurrencyConvertor";

function App() {
  return (
    <div className="container">
      <h1>React Event Examples</h1>

      <Counter />

      <hr />

      <Welcome />

      <hr />

      <SyntheticEvent />

      <hr />

      <CurrencyConvertor />
    </div>
  );
}

export default App;