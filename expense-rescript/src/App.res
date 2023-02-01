%%raw("import './App.css'")
@react.component
let make = () => {
  <ExpenseContext>
    <div className="app">
      <h1 className="heading"> {"Expense Tracker"->React.string} </h1>
      <TotalBalance />
      <IncomeExpenseCmp />
      <HistoryList />
      <AddNewTransactionCmp />
    </div>
  </ExpenseContext>
}
