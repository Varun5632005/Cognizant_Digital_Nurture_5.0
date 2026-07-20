function Welcome() {

  function showMessage(message) {
    alert(message);
  }

  return (

    <div>

      <h2>Welcome Example</h2>

      <button onClick={() => showMessage("Welcome")}>
        Say Welcome
      </button>

    </div>

  );
}

export default Welcome;