%%raw("import './NewTransaction.css'")
@react.component
let make = () => {
  let (text, setText) = React.useState(_ => "")
  let (price, setPrice) = React.useState(_ => "")
  let (id, setId) = React.Uncurried.useState(_ => 1)
  let (error, setError) = React.useState(_ => false)
  let {addTransactionHandler} = React.useContext(GlobalContext.context)

  let onSubmit = e => {
    ReactEvent.Form.preventDefault(e)
    if text == "" || price == "" {
      setError(_ => true)
    } else {
      setError(_ => false)
      setId(.prev => prev + 1)
      let price = Belt.Int.fromString(price)
      let price = switch price {
      | None => 0.
      | Some(v) => Belt.Int.toFloat(v)
      }
      addTransactionHandler({
        id,
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
          let updatedTransactionText = ReactEvent.Form.target(e)["value"]
          setText(_ => updatedTransactionText)
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
          let updatedPrice = ReactEvent.Form.target(e)["value"]
          setPrice(updatedPrice)
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
