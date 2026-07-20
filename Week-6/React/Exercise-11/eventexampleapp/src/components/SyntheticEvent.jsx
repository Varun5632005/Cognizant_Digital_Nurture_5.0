function SyntheticEvent() {

  function onPress(event) {

    alert("I was clicked");

    console.log(event);

  }

  return (

    <div>

      <h2>Synthetic Event Example</h2>

      <button onClick={onPress}>
        OnPress
      </button>

    </div>

  );
}

export default SyntheticEvent;