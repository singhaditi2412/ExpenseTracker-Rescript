%%raw("import './TotalBalance.css'")
@react.component
let make = () => {
  let {transactions} = React.useContext(GlobalContext.context)
  let total = Belt.Array.reduce(transactions, 0, (acc, value: GlobalContext.transaction) =>
    acc + value.price
  )
  <div className="total-balance">
    <h3> {"YOUR BALANCE"->React.string} </h3>
    <h1>
      {React.string("$")}
      {{total}->Belt.Int.toString->React.string}
    </h1>
  </div>
}
