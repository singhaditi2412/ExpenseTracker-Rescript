type t = {text: string, price: int}
@val @scope("JSON") external parseTransactions: string => array<t> = "parse"
type state = array<t>
let initialState = []
type contextType = {
  transactions: array<t>,
  addTransaction: t => unit,
}

let context = React.createContext({
  let getSavedTransactions = () => {
    switch Dom.Storage2.getItem(Dom.Storage2.sessionStorage, "getSavedTransactions") {
    | None => []
    | Some(value: string) => parseTransactions(value)
    }
  }
  {transactions: getSavedTransactions(), addTransaction: _ => ()}
})

module Provider = {
  let make = React.Context.provider(context)
  @react.component
  let make = (~value, ~children) => {
    React.createElement(make, {"value": value, "children": children})
  }
}

type actions = AddTransaction(t)
let reducer = (state, action) => {
  switch action {
  | AddTransaction(t) =>
    let getStringifiedTransactions = () => {
      switch Js.Json.stringifyAny((Js.Array2.concat(state, [t]): array<t>)) {
      | None => ""
      | Some(v) => v
      }
    }
    Dom.Storage2.setItem(
      Dom.Storage2.sessionStorage,
      "getSavedTransactions",
      {getStringifiedTransactions()},
    )
    Js.Array2.concat(state, [t])
  }
}

@react.component
let make = (~children: React.element) => {
  let (state, dispatch) = React.useReducer(reducer, initialState)
  <>
    <Provider
      value={{
        transactions: state,
        addTransaction: transaction => dispatch(AddTransaction(transaction)),
      }}>
      children
    </Provider>
  </>
}
