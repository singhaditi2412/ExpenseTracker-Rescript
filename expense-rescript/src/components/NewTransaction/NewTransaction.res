%%raw("import './NewTransaction.css'")
@react.component
let make = () => {
  let (text, setText) = React.useState(_ => "")
  let (price, setPrice) = React.useState(_ => 0)
  let (id, setId) = React.Uncurried.useState(_ => 1)
  let {addTransactionHandler} = React.useContext(GlobalContext.context)

  let onSubmit = e => {
    ReactEvent.Form.preventDefault(e)
    setId(.prev => prev+1)
    addTransactionHandler({
      id: id,
      text: text,
      price: price
    })
    setPrice(_ => 0)
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
      <label> {React.string("Amount")} </label>
      <label> {React.string("negative - expense, positive - income")} </label>
      <input
        type_= "number"
        value={Belt.Int.toString(price)}
        onChange={e => {
          let updatedPrice = ReactEvent.Form.target(e)["value"]
          setPrice(_ => updatedPrice)
        }}
        placeholder="Enter amount..."
      />
      <button type_="submit"> {React.string("Add transaction")} </button>
      
    </form>
  </div>
}
