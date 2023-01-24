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
          <li key={Belt.Int.toString(transaction.id)}>
            <p> {React.string(transaction.text)} </p>
            <p>
              {React.string("$")}
              {transaction.price->Belt.Int.toString->React.string}
            </p>
          </li>
        })
        ->React.array}
      </ul>
    </div>
  </div>
}
