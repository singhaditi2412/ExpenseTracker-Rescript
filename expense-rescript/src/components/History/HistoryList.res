%%raw("import './History.css'")
@react.component
let make = () => {
  let {transactions} = React.useContext(GlobalContext.context)
  <div className="history">
    <h3 className="history-heading">
      {React.string("History")}
      <hr />
    </h3>
    <div>
      <ul className="history-list">
        {transactions
        ->Belt.Array.map(transaction => {
          <li key={Belt.Int.toString(transaction.id)}> {React.string(transaction.text)} </li>
        })
        ->React.array}
      </ul>
    </div>
  </div>
}
//   {transactions.map(transaction => <History key={transaction.id} transaction={transaction} />)}
