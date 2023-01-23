// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

var state = [];

var context = React.createContext({
      transactions: [],
      addTransactionHandler: (function (param) {
          
        })
    });

var make = context.Provider;

function GlobalContext$ExpenseTrackerContext$Provider(Props) {
  var value = Props.value;
  var children = Props.children;
  return React.createElement(make, {
              value: value,
              children: children
            });
}

var Provider = {
  make: GlobalContext$ExpenseTrackerContext$Provider
};

var ExpenseTrackerContext = {
  Provider: Provider
};

function reducer(state, action) {
  return state.concat([action._0]);
}

function GlobalContext(Props) {
  var children = Props.children;
  var match = React.useReducer(reducer, state);
  var dispatch = match[1];
  return React.createElement(React.Fragment, undefined, React.createElement(GlobalContext$ExpenseTrackerContext$Provider, {
                  value: {
                    transactions: match[0],
                    addTransactionHandler: (function (transaction) {
                        Curry._1(dispatch, /* AddTransaction */{
                              _0: transaction
                            });
                      })
                  },
                  children: children
                }));
}

var make$1 = GlobalContext;

export {
  state ,
  context ,
  ExpenseTrackerContext ,
  reducer ,
  make$1 as make,
}
/* context Not a pure module */
