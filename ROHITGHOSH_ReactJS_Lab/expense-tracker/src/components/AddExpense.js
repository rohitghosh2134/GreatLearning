import React, { useState } from 'react';
import axios from 'axios';
import './/AddExpense.css'; // Import the CSS file

const AddExpense = () => {
    const [title, setTitle] = useState('');
    const [amount, setAmount] = useState('');

    const handleSubmit = (e) => {
        e.preventDefault();
        const newExpense = {
            title,
            amount: parseFloat(amount),
        };

        axios.post('http://localhost:4000/expenses', newExpense).then(() => {
            setTitle('');
            setAmount('');
            alert('Expense added successfully!');
        });
    };

    return (
        <div className="add-expense-container">
            <div>
                <h2>Add Expense</h2>
                <form onSubmit={handleSubmit}>
                    <label>Title:</label>
                    <input
                        type="text"
                        value={title}
                        onChange={(e) => setTitle(e.target.value)}
                    />
                    <label>Amount:</label>
                    <input
                        type="number"
                        step="0.01"
                        value={amount}
                        onChange={(e) => setAmount(e.target.value)}
                    />
                    <button type="submit">Add</button>
                </form>
            </div>
        </div>

    );
};

export default AddExpense;
