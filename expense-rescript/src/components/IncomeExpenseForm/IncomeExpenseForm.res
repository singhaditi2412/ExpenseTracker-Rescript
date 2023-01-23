%%raw("import './IncomeExpenseForm.css'")
@react.component
let make = () => {
  let {transactions} = React.useContext(GlobalContext.context)
  let income = Belt.Array.reduce(transactions, 0, (acc, value: GlobalContext.transaction) =>
    value.price >= 0 ? acc + value.price : acc + 0
  )
  let income = Belt.Int.toString(income)

  let expense = Belt.Array.reduce(transactions, 0, (acc, value: GlobalContext.transaction) =>
    value.price < 0 ? acc + value.price : acc + 0
  )
  Js.log(income)
  let expense = -1 * expense
  let expense = Belt.Int.toString(expense)
  Js.log(expense)
  

  <div className="income-expense-form">
    <div className="income">
      <h3 className="income-expense-title"> {React.string("INCOME")} </h3>
      <p className="income-money"> {income->React.string} </p>
    </div>
    <div className="middle-border" />
    <div className="expense">
      <h3 className="income-expense-title"> {React.string("EXPENSE")} </h3>
      <p className="expense-money"> {expense->React.string} </p>
    </div>
  </div>
}
