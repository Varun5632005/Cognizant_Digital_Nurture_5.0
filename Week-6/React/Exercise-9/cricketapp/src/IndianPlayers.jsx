function IndianPlayers() {

  const teamPlayers = [
    "Virat Kohli",
    "Rohit Sharma",
    "Shubman Gill",
    "KL Rahul",
    "Hardik Pandya",
    "Ravindra Jadeja"
  ];

  const [
    odd1,
    even1,
    odd2,
    even2,
    odd3,
    even3
  ] = teamPlayers;

  const T20players = [
    "Virat Kohli",
    "Rohit Sharma",
    "Surya Kumar"
  ];

  const RanjiPlayers = [
    "Cheteshwar Pujara",
    "Ajinkya Rahane",
    "Hanuma Vihari"
  ];

  const mergedPlayers = [...T20players, ...RanjiPlayers];

  return (

    <div>

      <h1>Indian Players</h1>

      <h2>Odd Team Players</h2>

      <ul>
        <li>{odd1}</li>
        <li>{odd2}</li>
        <li>{odd3}</li>
      </ul>

      <h2>Even Team Players</h2>

      <ul>
        <li>{even1}</li>
        <li>{even2}</li>
        <li>{even3}</li>
      </ul>

      <h2>Merged Players</h2>

      <ul>

        {mergedPlayers.map((player, index) => (
          <li key={index}>{player}</li>
        ))}

      </ul>

    </div>

  );
}

export default IndianPlayers;