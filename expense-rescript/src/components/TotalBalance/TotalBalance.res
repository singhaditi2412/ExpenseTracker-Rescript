%%raw("import './TotalBalance.css'")
@react.component
let make = () => {
  let {transactions} = React.useContext(ExpenseContext.context)
  let total = Belt.Array.reduce(transactions, 0, (acc, value: ExpenseContext.t) =>
    acc + value.price
  )
  <div className="total-balance">
    <h3> {"YOUR BALANCE"->React.string} </h3>
    <h1>
      {`\u20B9 ${Belt.Int.toString(total)}`->React.string}
    </h1>
  </div>
}
