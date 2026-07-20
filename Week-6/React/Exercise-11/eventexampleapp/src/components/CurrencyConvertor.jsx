import { useState } from "react";

function CurrencyConvertor() {
  const [rupees, setRupees] = useState("");
  const [currency, setCurrency] = useState("EUR");
  const [result, setResult] = useState("");

  const exchangeRates = {
    EUR: 90,    // 1 Euro = ₹90
    USD: 83,    // 1 Dollar = ₹83
    GBP: 105,   // 1 Pound = ₹105
    JPY: 0.56,  // 1 Yen = ₹0.56
    AUD: 55,    // 1 Australian Dollar = ₹55
    CAD: 61     // 1 Canadian Dollar = ₹61
  };

  function handleSubmit() {
    if (rupees === "") {
      alert("Please enter the amount in Rupees.");
      return;
    }

    const converted = Number(rupees) / exchangeRates[currency];
    setResult(converted.toFixed(2));
  }

  return (
    <div>
      <h2>Currency Converter</h2>

      <input
        type="number"
        placeholder="Enter Amount in Rupees"
        value={rupees}
        onChange={(e) => setRupees(e.target.value)}
      />

      <br /><br />

      <label>Select Currency: </label>

      <select
        value={currency}
        onChange={(e) => setCurrency(e.target.value)}
      >
        <option value="EUR">Euro (€)</option>
        <option value="USD">US Dollar ($)</option>
        <option value="GBP">British Pound (£)</option>
        <option value="JPY">Japanese Yen (¥)</option>
        <option value="AUD">Australian Dollar (A$)</option>
        <option value="CAD">Canadian Dollar (C$)</option>
      </select>

      <br /><br />

      <button onClick={handleSubmit}>
        Convert
      </button>

      {result && (
        <h3>
          Converted Amount: {result} {currency}
        </h3>
      )}
    </div>
  );
}

export default CurrencyConvertor;