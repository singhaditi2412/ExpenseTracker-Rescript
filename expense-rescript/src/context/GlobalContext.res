@react.component
type transaction = {id: int, text: string, price: int}
type state = array<transaction>
let state = []
// let state: array<transaction> = [{id: 0, text: "", price: 0}]
type contextType = {
  transactions: array<transaction>,
  addTransactionHandler: transaction => unit,
}
let context = React.createContext({
  transactions: [],
  addTransactionHandler: _ => (),
})
module ExpenseTrackerContext = {
  module Provider = {
    let make = React.Context.provider(context)

    @react.component
    let make = (~value, ~children) => {
      React.createElement(make, {"value": value, "children": children})
    }
  }
}

type actions = AddTransaction(transaction)
let reducer = (state, action) => {
  switch action {
  | AddTransaction(transaction) => Js.Array2.concat(state, [transaction])
  }
}
// Js.log(state)
@react.component
let make = (~children: React.element) => {
  let (state, dispatch) = React.useReducer(reducer, state)
  <>
    <ExpenseTrackerContext.Provider
      value={{
        transactions: state,
        addTransactionHandler: transaction => dispatch(AddTransaction(transaction)),
      }}>
      children
    </ExpenseTrackerContext.Provider>
  </>
}
