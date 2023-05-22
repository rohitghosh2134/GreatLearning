import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Expenses from './components/Expenses';
import AddExpense from './components/AddExpense';
import './App.css'; // Import your custom CSS file

const App = () => {
  return (
    <Router>
      <div className="app-container"> {/* Apply styles to the app container */}
        <nav>
          <ul className="nav-menu"> {/* Apply styles to the navigation menu */}
            <li>
              <Link to="/" className="nav-link">Expenses</Link> {/* Apply styles to the navigation links */}
            </li>
            <li>
              <Link to="/add" className="nav-link">Add Expense</Link> {/* Apply styles to the navigation links */}
            </li>
          </ul>
        </nav>

        <Routes>
          <Route path="/add" element={<AddExpense />} />
          <Route path="/" element={<Expenses />} />
        </Routes>
      </div>
    </Router>
  );
};

export default App;
