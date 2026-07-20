import "./App.css";
import officeImg from "./assets/office.png";

function App() {

  const office = {
    name: "Skyline Tech Park",
    rent: 55000,
    address: "Madhapur, Hyderabad"
  };

  const officeList = [
    {
      id: 1,
      name: "Skyline Tech Park",
      rent: 55000,
      address: "Hyderabad"
    },
    {
      id: 2,
      name: "Cyber Towers",
      rent: 70000,
      address: "Bangalore"
    },
    {
      id: 3,
      name: "Phoenix Business Hub",
      rent: 45000,
      address: "Chennai"
    },
    {
      id: 4,
      name: "Infinity Tower",
      rent: 90000,
      address: "Mumbai"
    }
  ];

  return (
    <div className="container">

      <h1>Office Space Rental App</h1>

      <img
        src={officeImg}
        alt="Office"
        width="500"
        height="300"
      />

      <h2>Featured Office</h2>

      <p>
        <strong>Name:</strong> {office.name}
      </p>

      <p
        style={{
          color: office.rent < 60000 ? "red" : "green",
          fontWeight: "bold"
        }}
      >
        Rent: ₹{office.rent}
      </p>

      <p>
        <strong>Address:</strong> {office.address}
      </p>

      <hr />

      <h2>Available Office Spaces</h2>

      {officeList.map((item) => (
        <div key={item.id} className="card">

          <h3>{item.name}</h3>

          <p
            style={{
              color: item.rent < 60000 ? "red" : "green",
              fontWeight: "bold"
            }}
          >
            Rent: ₹{item.rent}
          </p>

          <p>Address: {item.address}</p>

        </div>
      ))}

    </div>
  );
}

export default App;