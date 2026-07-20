import { useState } from "react";

function Counter() {

  const [count, setCount] = useState(0);

  function increment() {
    setCount(count + 1);
  }

  function decrement() {
    setCount(count - 1);
  }

  function sayHello() {
    alert("Hello! Welcome to React Event Handling");
  }

  function handleIncrement() {
    increment();
    sayHello();
  }

  return (
    <div>

      <h2>Counter Example</h2>

      <h3>Counter : {count}</h3>

      <button onClick={handleIncrement}>
        Increment
      </button>

      <button onClick={decrement}>
        Decrement
      </button>

    </div>
  );
}

export default Counter;