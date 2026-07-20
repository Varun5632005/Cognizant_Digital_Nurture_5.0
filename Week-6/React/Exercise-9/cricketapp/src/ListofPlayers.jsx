function ListofPlayers() {

  const players = [
    { name: "Virat Kohli", score: 95 },
    { name: "Rohit Sharma", score: 88 },
    { name: "Shubman Gill", score: 82 },
    { name: "KL Rahul", score: 68 },
    { name: "Hardik Pandya", score: 60 },
    { name: "Ravindra Jadeja", score: 75 },
    { name: "Rishabh Pant", score: 64 },
    { name: "Surya Kumar", score: 91 },
    { name: "MS Dhoni", score: 98 },
    { name: "Jasprit Bumrah", score: 55 },
    { name: "Mohammed Shami", score: 72 }
  ];

  const lowScorePlayers = players.filter(player => player.score < 70);

  return (
    <div>

      <h1>List of Players</h1>

      <table border="1" cellPadding="8">

        <thead>
          <tr>
            <th>Name</th>
            <th>Score</th>
          </tr>
        </thead>

        <tbody>

          {players.map((player, index) => (
            <tr key={index}>
              <td>{player.name}</td>
              <td>{player.score}</td>
            </tr>
          ))}

        </tbody>

      </table>

      <br />

      <h2>Players with Scores Below 70</h2>

      <ul>

        {lowScorePlayers.map((player, index) => (
          <li key={index}>
            {player.name} - {player.score}
          </li>
        ))}

      </ul>

    </div>
  );
}

export default ListofPlayers;