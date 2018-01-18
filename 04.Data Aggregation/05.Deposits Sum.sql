SELECT DepositGroup, SUM(DepositAmount) AS [Total Sum] FROM WizzardDeposits
GROUP BY DepositGroup