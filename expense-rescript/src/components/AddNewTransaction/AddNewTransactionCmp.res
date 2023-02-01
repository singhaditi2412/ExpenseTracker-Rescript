%%raw("import './AddNewTransactionCmp.css'")
@react.component
let make = () => {
  let (text, setText) = React.useState(_ => "")
  let (price, setPrice) = React.useState(_ => "")
  let (error, setError) = React.useState(_ => false)
  let {addTransaction} = React.useContext(ExpenseContext.context)

  let onSubmit = e => {
    ReactEvent.Form.preventDefault(e)
    if text == "" || price == "" {
      setError(_ => true)
    } else {
      setError(_ => false)
      let price = Belt.Int.fromString(price)
      let price = switch price {
      | None => 0.
      | Some(v) => Belt.Int.toFloat(v)
      }
      addTransaction({
        text,
        price: Belt.Float.toInt(price),
      })
    }
    setPrice(_ => "")
    setText(_ => "")
  }
  <div className="new-transaction">
    <h3>
      {React.string("Add New Transaction")}
      <hr />
    </h3>
    <form onSubmit={onSubmit}>
      <label> {React.string("Text")} </label>
      <input
        type_="text"
        value={text}
        onChange={e => {
          setText(_ => ReactEvent.Form.target(e)["value"])
        }}
        placeholder="Enter text..."
      />
      {error && text <= Belt.Int.toString(0)
        ? <div className="error-label"> {React.string("Enter text")} </div>
        : {React.string("")}}
      <label> {React.string("Amount")} </label>
      <label> {React.string("negative - expense, positive - income")} </label>
      <input
        type_="number"
        value={price}
        onChange={e => {
          setPrice(ReactEvent.Form.target(e)["value"])
        }}
        placeholder="Enter amount..."
      />
      {error && price <= Belt.Int.toString(0)
        ? <div className="error-label"> {React.string("Enter amount")} </div>
        : {React.string("")}}
      <button type_="submit"> {React.string("Add transaction")} </button>
    </form>
  </div>
}
