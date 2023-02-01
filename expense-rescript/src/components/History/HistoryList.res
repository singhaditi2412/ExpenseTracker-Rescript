%%raw("import './History.css'")
@react.component
let make = () => {
  let {transactions} = React.useContext(ExpenseContext.context)
  <div className="history">
    <h3 className="history-heading">
      {React.string("History")}
      <hr />
    </h3>
    <div>
      <ul className="history-list">
        {transactions
        ->Belt.Array.map(transaction => {
          let amountColor = transaction.price > 0 ? "positive" : "negative"
          <li key={(transaction.text)} className="history-list-content">
            <p className="list-text"> {React.string(transaction.text)} </p>
            <div className="history-list-card-end">
              <p className="list-amount">
              {`\u20B9 ${Belt.Int.toString(transaction.price)}`->React.string}
            </p>
            <div className={amountColor}></div>
          </div>
          </li>
        })
        ->React.array}
      </ul>
    </div>
  </div>
}
