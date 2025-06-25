CREATE TABLE bank_transactions (
    txn_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    branch VARCHAR(50),
    txn_type VARCHAR(20),
    amount INTEGER,
    txn_date DATE
);

INSERT INTO bank_transactions (customer_name, branch, txn_type, amount, txn_date) VALUES
('Rutuja', 'Mumbai', 'Deposit', 8000, '2025-01-01'),
('Naman', 'Pune', 'Withdrawal', 2000, '2025-01-02'),
('Erin', 'Delhi', 'Transfer', 3000, '2025-01-03'),
('Aman', 'Mumbai', 'Deposit', 5000, '2025-01-04'),
('Sneha', 'Pune', 'Deposit', 2500, '2025-01-05'),
('Raj', 'Delhi', 'Withdrawal', 1500, '2025-01-06'),
('Pooja', 'Mumbai', 'Transfer', 7000, '2025-01-07'),
('Karan', 'Pune', 'Deposit', 4000, '2025-01-08'),
('Meera', 'Delhi', 'Withdrawal', 2000, '2025-01-09'),
('Tina', 'Mumbai', 'Deposit', 3500, '2025-01-10'),
('Vikas', 'Pune', 'Deposit', 9000, '2025-01-11'),
('Aryan', 'Delhi', 'Transfer', 1000, '2025-01-12'),
('Simran', 'Mumbai', 'Withdrawal', 6000, '2025-01-13'),
('Zoya', 'Pune', 'Deposit', 5000, '2025-01-14'),
('Neil', 'Delhi', 'Deposit', 4500, '2025-01-15'),
('Fatima', 'Mumbai', 'Withdrawal', 3000, '2025-01-16'),
('Ankit', 'Pune', 'Transfer', 2500, '2025-01-17'),
('Ishita', 'Delhi', 'Deposit', 5500, '2025-01-18'),
('Raghav', 'Mumbai', 'Withdrawal', 2000, '2025-01-19'),
('Kiara', 'Pune', 'Deposit', 6000, '2025-01-20');

--To fetch all the data
SELECT*FROM bank_transactions;

--Forgot to put kiara's data, that's why used TRUNCATE.
TRUNCATE TABLE bank_transactions RESTART IDENTITY;

--To choose specific column
SELECT customer_name, branch, amount FROM bank_transactions;

--WHERE: Filter the data
SELECT customer_name, amount
FROM bank_transactions
WHERE amount > 5000;

--ORDER BY : Arrange the data Big to Small / ASC or DESC
SELECT customer_name, amount
FROM bank_transactions
ORDER BY amount DESC;

--GROUP BY : Group same type together
SELECT branch, COUNT(*) AS txn_count
FROM bank_transactions
GROUP BY branch;

--AGGREGRATE FUNCTIONS
--(a)Total Deposit by each branch
SELECT branch, SUM(amount) AS total_amount
FROM bank_transactions
WHERE txn_type = 'Deposit'
GROUP BY branch;

--(b)Average transaction amount by each branch
SELECT branch, AVG(amount) AS avg_amount
FROM bank_transactions
GROUP BY branch;

--(c)Max transaction per transaction type
SELECT txn_type, MAX(amount) AS max_amount
FROM bank_transactions
GROUP BY txn_type;

--COUNT all withdrawals
SELECT COUNT(*) AS withdrawal_count
FROM bank_transactions
WHERE txn_type = 'Withdrawal';

--COUNT all Transfer
SELECT COUNT(*) AS transfer_count
FROM bank_transactions
WHERE txn_type = 'Transfer';

--List customers and their transaction types from Mumbai branch only
SELECT customer_name, txn_type
FROM bank_transactions
WHERE branch = 'Mumbai';

--Show total amount transacted by each customer from DESC to ASC order
SELECT customer_name, SUM(amount) AS total_transacted
FROM bank_transactions
GROUP BY customer_name
ORDER BY total_transacted DESC;

--Show total amount transacted by each customer (customer_name alphabetically)
SELECT customer_name, SUM(amount) AS total_transacted
FROM bank_transactions
GROUP BY customer_name
ORDER BY customer_name ASC;

--What is the maximum amount withdrawn?
SELECT MAX(amount) AS max_withdrawal
FROM bank_transactions
WHERE txn_type = 'Withdrawal';

–-Find customers who deposited more than ₹5000 (grouped total)
SELECT customer_name, SUM(amount) AS total_deposit
FROM bank_transactions
WHERE txn_type = 'Deposit'
GROUP BY customer_name
HAVING SUM(amount) > 5000;

–-What is the average amount transferred by each branch
SELECT branch, AVG(amount) AS avg_transfer
FROM bank_transactions
WHERE txn_type = 'Transfer'
GROUP BY branch;

--List all transactions in descending order of amount
SELECT customer_name, amount
FROM bank_transactions
ORDER BY amount DESC;

--Find total number of deposits
SELECT COUNT(*) AS total_deposits
FROM bank_transactions
WHERE txn_type = 'Deposit';

--Show customer name, branch, and amount where amount is between ₹2000 and ₹5000
SELECT customer_name, branch, amount
FROM bank_transactions
WHERE amount BETWEEN 2000 AND 5000;

--top 5 highest transactions
SELECT * FROM bank_transactions
ORDER BY amount DESC
LIMIT 5;

--Bank transaction between 3000 and 6000
SELECT customer_name, amount
FROM bank_transactions
WHERE amount BETWEEN 3000 AND 6000;

--Find names starting with R
SELECT customer_name
FROM bank_transactions
WHERE customer_name LIKE 'R%';
