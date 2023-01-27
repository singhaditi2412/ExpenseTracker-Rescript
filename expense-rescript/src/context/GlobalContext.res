@react.component
type transaction = {id: int, text: string, price: int}
@val @scope("JSON") external parseIntoMyData: string => array<transaction> = "parse"
type state = array<transaction>
let state = []
type contextType = {
  transactions: array<transaction>,
  addTransactionHandler: transaction => unit,
}
let context = React.createContext({
  let saveTransactions = Dom.Storage2.getItem(Dom.Storage2.sessionStorage, "saveTransactions")
  {
    transactions: switch saveTransactions {
    | None => []
    | Some(value: string) => parseIntoMyData(value)
    },
    addTransactionHandler: _ => (),
  }
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
  | AddTransaction(transaction) =>
    Dom.Storage2.setItem(
      Dom.Storage2.sessionStorage,
      "saveTransactions",
      switch Js.Json.stringifyAny((Js.Array2.concat(state, [transaction]): array<transaction>)) {
      | None => ""
      | Some(v) => v
      },
    )

    Js.Array2.concat(state, [transaction])
  }
}
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
