import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './Expenses.css'; // Import the CSS file

const Expenses = () => {
    const [expenses, setExpenses] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:4000/expenses').then((response) => {
            setExpenses(response.data);
        });
    }, []);

    const getTotalSpent = () => {
        return expenses.reduce((total, expense) => total + expense.amount, 0);
    };

    const calculatePayment = () => {
        const totalSpent = getTotalSpent();
        const averageSpent = totalSpent / expenses.length;
        const paymentDetails = {};

        expenses.forEach((expense) => {
            const difference = expense.amount - averageSpent;
            if (difference > 0) {
                paymentDetails[expense.id] = {
                    payee: expense.title,
                    payer: 'You',
                    amount: difference.toFixed(2),
                };
            } else if (difference < 0) {
                paymentDetails[expense.id] = {
                    payee: 'You',
                    payer: expense.title,
                    amount: (-difference).toFixed(2),
                };
            }
        });

        return paymentDetails;
    };

    const paymentDetails = calculatePayment();

    return (
        <div className="expenses-container">
            <div>
                <h2>Expenses</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        {expenses.map((expense) => (
                            <tr key={expense.id}>
                                <td>{expense.id}</td>
                                <td>{expense.title}</td>
                                <td>{expense.amount}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
                <h2>Total Spent: ${getTotalSpent().toFixed(2)}</h2>
                <h2>Payment Details:</h2>
                <ul>
                    {Object.keys(paymentDetails).map((expenseId) => {
                        const payment = paymentDetails[expenseId];
                        return (
                            <li key={expenseId}>
                                {payment.payee} owes {payment.payer} ${payment.amount}
                            </li>
                        );
                    })}
                </ul>
            </div>
        </div>
    );
};

export default Expenses;
