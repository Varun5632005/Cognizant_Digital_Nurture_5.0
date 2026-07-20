function FlightDetails() {
  const flights = [
    {
      id: 1,
      flight: "IndiGo",
      from: "Hyderabad",
      to: "Delhi",
      price: "₹4,500"
    },
    {
      id: 2,
      flight: "Air India",
      from: "Chennai",
      to: "Mumbai",
      price: "₹5,200"
    },
    {
      id: 3,
      flight: "Vistara",
      from: "Bangalore",
      to: "Kolkata",
      price: "₹6,100"
    }
  ];

  return (
    <div>
      <h2>Available Flights</h2>

      <table border="1" cellPadding="10">
        <thead>
          <tr>
            <th>Flight</th>
            <th>From</th>
            <th>To</th>
            <th>Price</th>
          </tr>
        </thead>

        <tbody>
          {flights.map((flight) => (
            <tr key={flight.id}>
              <td>{flight.flight}</td>
              <td>{flight.from}</td>
              <td>{flight.to}</td>
              <td>{flight.price}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default FlightDetails;