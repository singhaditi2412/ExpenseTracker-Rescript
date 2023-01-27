%%raw("import './App.css'")
@react.component
let make = () => {
  <GlobalContext>
    <div className="app">
      <h1 className="heading"> {"Expense Tracker"->React.string} </h1>
      <TotalBalance />
      <IncomeExpenseForm />
      <HistoryList />
      <NewTransaction />
    </div>
  </GlobalContext>
}
