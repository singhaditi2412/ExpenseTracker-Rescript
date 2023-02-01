%%raw("import './IncomeExpenseCmp.css'")
@react.component
let make = () => {
  let {transactions} = React.useContext(ExpenseContext.context)
  let income = Belt.Array.reduce(transactions, 0, (acc, value: ExpenseContext.t) =>
    value.price >= 0 ? acc + value.price : acc
  )

  let expense = Belt.Array.reduce(transactions, 0, (acc, value: ExpenseContext.t) =>
    value.price < 0 ? acc + value.price : acc
  )

  <div className="income-expense-cmp">
    <div className="income">
      <p className="title"> {React.string("INCOME")} </p>
      <p className="income-amount"> {Belt.Int.toString(income)->React.string} </p>
    </div>
    <div className="expense">
      <p className="title"> {React.string("EXPENSE")} </p>
      <p className="expense-amount"> {Belt.Int.toString(expense)->React.string} </p>
    </div>
  </div>
}
